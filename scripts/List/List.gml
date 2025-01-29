function List() constructor {
    list = ds_list_create()
    
    add = function(value) {
        for(i = 0; i < argument_count; i++)
            ds_list_add(list, argument[i])
    }
    
    addAll = function(_list) {
        for(var i = 0; i < _list.size(); i ++) {
            add(_list.get(i))
        }
    }
    
    addArray = function(array) {
        for(var i = 0; i < array_length(array); i ++) {
            add(array[i])
        }
    }
    
    clear = function() {
        ds_list_clear(list)
    }
    
    size = function() {
        return ds_list_size(list)
    }
    
    isEmpty = function() {
        return size() == 0
    }
    
    equals = function(_list) {
        if size() == _list.size() {
            for(var i = 0; i < size(); i++) {
                if get(i) != _list.get(i) {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
    
    exists = function(_func) {
        for(var i = 0; i < size(); i++) {
            var el = get(i);
            if _func(el) {
                return true
            }
        }
        return false
    }
    
    get = function(num) {
        return list[|num]
    }
    
    set = function(number, value) {
        list[| number] = value
    }
    
    find = function(_func) {
        for(var i = 0; i < size(); i++) {
            var el = get(i);
            if _func(el) {
                return el
            }
        }
        return noone
    }
    
    findAll = function(_func) {
        var return_list = new List();
        
        for(var i = 0; i < size(); i++) {
            var el = get(i);
            if _func(el) {
                return_list.add(el)
            }
        }
        return return_list
    }
    
    findIndex = function(_func) {
        indexOf(find(_func))
    }
    
    findLast = function() {
        return list[|size() - 1]
    }
    
    indexOf = function(value) {
        return ds_list_find_index(list, value)
    }
    
    insert = function(pose, value) {
        ds_list_insert(list, pose, value)
    }
    
    insertAll = function(pose, _list) {
        for(var i = _list.size() - 1; i >= 0; i --) {
            insert(pose, _list.get(i))
        }
    }
        
    remove = function(value) {
        var find_del = ds_list_find_index(list, value);
        
        if (find_del >= 0)
            ds_list_delete(list, find_del)
    }
    
    removeAll = function(_func) {
        var temporary_array = toArray()
        for (var i = 0; i < array_length(temporary_array); i++) {
            var el = temporary_array[i];
            if _func(el) {
                remove(el)
            }
        }
    }
    
    forEach = function(_func) {
        var temporary_array = toArray()
        for (var i = 0; i < array_length(temporary_array); i++) {
            var el = temporary_array[i];
            _func(el)
        }
    }
    
    shuffle = function() {
        ds_list_shuffle(list)
    }
    
    sort = function(_func) {
        var temporary_array = toArray();
        array_sort(temporary_array, _func)
        clear()
        addArray(temporary_array)
    }
    
    toArray = function() {
        var temporary_array = [];
        for (var i = 0; i < self.size(); i++) {
            var el = self.get(i);
            array_push(temporary_array, el)
        }
        return temporary_array
    }
    
    toString = function() {
        var str = "[";
        for(var i = 0; i < size(); i++) {
            var el = get(i);
            if i > 0 {
                str += ", "
            }
            str += string(el)
        }
        str += "]"
        return str
    }
    
    destroy = function() {
        ds_list_destroy(list)
    }
}