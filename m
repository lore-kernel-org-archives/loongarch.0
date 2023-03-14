Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D743C30
	for <loongarch@lists.linux.dev>; Tue, 14 Mar 2023 16:46:45 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id b16so6651003iof.11
        for <loongarch@lists.linux.dev>; Tue, 14 Mar 2023 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678812405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ThLTMTY4kfZsGd2CRXemaZMj0W5Geu4yukgMMkV4a24=;
        b=P86q0C6PPyPmWNrYZg7AbKaXDevr5rFFuOs+G8nQBCHON7OsNqwwfDe4vIU74zTOfW
         mUBSWOV3IE81Yt8zKZlpJTSU2EQ3dFf5ylEeCSARlEz2UBKGj10jbx2iR7iAIRLzrxec
         yq/j0Bra1bPYjHTiuJO5wEfrsL6xo7sNOccuhse0m+uwRAZlhT+gNzcTAaWVDq4eG4As
         FdBWzyzDl5cem7Kq5F3akoDKLRpIyRa2CbD/c//vQvAlvqque0Mf12ZU5Yeg1CBQ98Bo
         31EikedV6pZDHcJme78LekMJijqMHWykLX9J9w3Vd4EQy/vOncvtPCRF/+wCmCCYNstl
         8Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678812405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThLTMTY4kfZsGd2CRXemaZMj0W5Geu4yukgMMkV4a24=;
        b=Elrl1h6TOG6oOL/qITPYJIkJmqDzQ4Db9SOA63Ci6fh7dwWq7B5hkwlDmolYnvjnbY
         dSOUlY8BI0khagyqGdbN5o0ZptvI1uMjhGL9/s5cLVvIQ5ikyXYzTZFIkCW6ywx4LV9Y
         zXkKxp2mHuleOw1FJyE7UeAYmNrqBjxeZVdl01s7gIsEs5qwezLarOrp7/6pHdIdDN3r
         zOWFYDzCUSz0fiyB3qy2+a+ffuh20JPYNBsXnIsalHlAmsTZp9WvhC2YvhR38njVw1Ma
         /h8GI8Z90HDapGpFNVaxAvRq/5RpXezcOL7pA4OzM8TBUF8e3x3dZuD39DpdSvAfCdo+
         fyWA==
X-Gm-Message-State: AO0yUKVmwUxSx8vWatvbHYUN1+f20lcQrCGHPmFAimSLss6KqIyX7NRJ
	B9QMcdkOCwl/Pblf5vLOg5g=
X-Google-Smtp-Source: AK7set9eOUYg3yTxMgvtg9SCUI9/kBGNhSBNasC8VbrbO1x0pBDlIe732Dl5mGhBA+nfAt0zEoJh2g==
X-Received: by 2002:a05:6602:20c2:b0:74c:b069:f38c with SMTP id 2-20020a05660220c200b0074cb069f38cmr22109345ioz.1.1678812405114;
        Tue, 14 Mar 2023 09:46:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s27-20020a02cc9b000000b0040610ade715sm311493jap.83.2023.03.14.09.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:46:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <84760aa1-4eb5-18a3-203f-22dc2b69db65@roeck-us.net>
Date: Tue, 14 Mar 2023 09:46:42 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Problems when booting Loongarch in qemu with
 CONFIG_PROVE_LOCKING=y
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>, chenhuacai@kernel.org
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Xuefeng Li <lixuefeng@loongson.cn>
References: <8a44ad71-68d2-4926-892f-72bfc7a67e2a@roeck-us.net>
 <8e3c824a-7a33-a436-c827-60bbea11bad0@loongson.cn>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <8e3c824a-7a33-a436-c827-60bbea11bad0@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/14/23 04:48, Tiezhu Yang wrote:
> 
> 
> On 03/10/2023 02:20 AM, Guenter Roeck wrote:
>> Hi,
>>
>> when trying to boot Loongarch images in qemu with
>> defconfig+CONFIG_PROVE_LOCKING=y, I get the following traceback.
>>
>> [    7.530438] BUG: MAX_STACK_TRACE_ENTRIES too low!
>> [    7.530636] turning off the locking correctness validator.
> 
> I can reproduce this problem on my Loongson-3A5000 machine.
> 
>> Is this a known problem ? If so, is there a solution other than not enabling
>> CONFIG_PROVE_LOCKING ?
>>
> 
> The problem can be fixed with some small changes, I will
> send a patch in the next week after some testing.
> 

Thanks a lot!

Guenter


