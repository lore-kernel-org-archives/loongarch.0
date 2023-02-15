Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FF97B
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 07:52:01 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Axbdoej+xjV9kAAA--.2254S3;
	Wed, 15 Feb 2023 15:51:59 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxqb0cj+xjgrEzAA--.30885S3;
	Wed, 15 Feb 2023 15:51:58 +0800 (CST)
Subject: Re: "kernel ade access" oops on LoongArch
To: Youling Tang <tangyouling@loongson.cn>, Xi Ruoyao <xry111@xry111.site>
Cc: loongarch@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org
References: <1e6f4d35946e4e2e7c7f5dcc7b69d5e609de8184.camel@xry111.site>
 <2e902dfa-cb84-7ef0-6b50-02b16354a139@loongson.cn>
 <511d385675ea7a846ff791974c6ae7feeeec2589.camel@xry111.site>
 <9a70e89c-0f3b-0660-501e-3292e410cfd8@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <5403e5eb-5792-7d6f-df74-ca3fab82ecd5@loongson.cn>
Date: Wed, 15 Feb 2023 15:51:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9a70e89c-0f3b-0660-501e-3292e410cfd8@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Dxqb0cj+xjgrEzAA--.30885S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZF4xCF1rZrykWrWkCryxGrg_yoW8tF1kpr
	WSy3WFgFW5JFn3ArZIvrWUCFyrA34UG34DGw45GwnxZFZIvryYqa1agF1Fg3y7trZ5W3Wa
	qrWkKay5u3W8GaUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU8ewZ7UUUUU==

On 2023-02-15 15:23, Youling Tang wrote:

>
>
> On 02/15/2023 01:35 PM, Xi Ruoyao wrote:
>> On Wed, 2023-02-15 at 12:52 +0800, Youling Tang wrote:
>>> ../stdlib/stdlib.h:141:8: error: ‘_Float32’ does not name a type
>>>    141 | extern _Float32 strtof32 (const char *__restrict __nptr,
>>>        |        ^~~~~~~~
>>
>> This is because Glibc expects GCC 13 to support _Float32, but early GCC
>> 13 snapshots did not.
>>
>>> /usr/bin/ld: /home/loongson/build_glibc/libc.a(dl-reloc-static-pie.o):
>>> in function `_dl_relocate_static_pie':
>>> /home/loongson/glibc/elf/dl-reloc-static-pie.c:44: undefined reference
>>> to `_DYNAMIC'
>>
>> Oh, this one is my fault.  The check for compiler static PIE support was
>> not written correctly.  I'll fix it for Glibc later, but now you can
>> update GCC to the latest git master to proceed.
>>
>
> Tested on Loongson-3C5000L-LL machine, using CLFS7.3 system.
>
> $ gcc -v
> gcc version 13.0.0 20221018 (experimental) (GCC)
>
> # make check -j32
> /home/loongson/build_glibc/math/test-tgmath3-atan2.c: 
> 在函数‘test_atan2_84’中:
> /home/loongson/build_glibc/math/test-tgmath3-atan2.c:903:59: 
> 错误：conflicting types for ‘var__Float32x’; have ‘double’
>   903 |   extern typeof (atan2 (vol_var__Float32x, vol_var_char)) 
> var__Float32x __attribute__ ((unused));
>       | ^~~~~~~~~~~~~
>
> There was a build error in make check, so only tst-mallocfork3-
> malloc-check was tested separately.
>
> # make test t=malloc/tst-mallocfork3-malloc-check
> make[2]: 离开目录“/home/loongson/glibc/malloc”
> PASS: malloc/tst-mallocfork3-malloc-check
> original exit status 0
> info: signals received during fork: 301
> info: signals received during free: 1693
> info: signals received during malloc: 119
> make[1]: 离开目录“/home/loongson/glibc”
>
> A total of five tests are PASS, and the serial port does not display
> CallTrace.
>
> Youling.
>
I had test it by using the cmd "while true..." Ruoyao gave on

Loongson-3A5000, CLFS 7.1, 6.2-rc8 kernel with those patches and

6.2-rc7 kernel form loongson-next. No calltrace displayed, either.

Jinyang

