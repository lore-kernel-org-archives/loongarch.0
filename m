Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCB37B
	for <loongarch@lists.linux.dev>; Wed, 15 Feb 2023 07:23:06 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.200.1])
	by gateway (Coremail) with SMTP id _____8Cxf9tXiOxjd9cAAA--.2281S3;
	Wed, 15 Feb 2023 15:23:04 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.200.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxC75WiOxjQawzAA--.30175S3;
	Wed, 15 Feb 2023 15:23:03 +0800 (CST)
Subject: Re: "kernel ade access" oops on LoongArch
To: Xi Ruoyao <xry111@xry111.site>
References: <1e6f4d35946e4e2e7c7f5dcc7b69d5e609de8184.camel@xry111.site>
 <2e902dfa-cb84-7ef0-6b50-02b16354a139@loongson.cn>
 <511d385675ea7a846ff791974c6ae7feeeec2589.camel@xry111.site>
Cc: loongarch@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <9a70e89c-0f3b-0660-501e-3292e410cfd8@loongson.cn>
Date: Wed, 15 Feb 2023 15:23:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <511d385675ea7a846ff791974c6ae7feeeec2589.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxC75WiOxjQawzAA--.30175S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZFy7CFW8GFWDGF1DKryDJrb_yoW8CF18pr
	WayryFgFW8AFyftrW2v3yUCF1rJw4UG347Gw43JwsIvFsxXFy3tay3tFyFgw42yas5X3Wj
	grWkKFW5C3W8Gw7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bc8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAq
	jxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6c
	x26rWlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
	r21l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r
	1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RKtC7UUUUU



On 02/15/2023 01:35 PM, Xi Ruoyao wrote:
> On Wed, 2023-02-15 at 12:52 +0800, Youling Tang wrote:
>> ../stdlib/stdlib.h:141:8: error: ‘_Float32’ does not name a type
>>    141 | extern _Float32 strtof32 (const char *__restrict __nptr,
>>        |        ^~~~~~~~
>
> This is because Glibc expects GCC 13 to support _Float32, but early GCC
> 13 snapshots did not.
>
>> /usr/bin/ld: /home/loongson/build_glibc/libc.a(dl-reloc-static-pie.o):
>> in function `_dl_relocate_static_pie':
>> /home/loongson/glibc/elf/dl-reloc-static-pie.c:44: undefined reference
>> to `_DYNAMIC'
>
> Oh, this one is my fault.  The check for compiler static PIE support was
> not written correctly.  I'll fix it for Glibc later, but now you can
> update GCC to the latest git master to proceed.
>

Tested on Loongson-3C5000L-LL machine, using CLFS7.3 system.

$ gcc -v
gcc version 13.0.0 20221018 (experimental) (GCC)

# make check -j32
/home/loongson/build_glibc/math/test-tgmath3-atan2.c: 
在函数‘test_atan2_84’中:
/home/loongson/build_glibc/math/test-tgmath3-atan2.c:903:59: 
错误：conflicting types for ‘var__Float32x’; have ‘double’
   903 |   extern typeof (atan2 (vol_var__Float32x, vol_var_char)) 
var__Float32x __attribute__ ((unused));
       | 
^~~~~~~~~~~~~

There was a build error in make check, so only tst-mallocfork3-
malloc-check was tested separately.

# make test t=malloc/tst-mallocfork3-malloc-check
make[2]: 离开目录“/home/loongson/glibc/malloc”
PASS: malloc/tst-mallocfork3-malloc-check
original exit status 0
info: signals received during fork: 301
info: signals received during free: 1693
info: signals received during malloc: 119
make[1]: 离开目录“/home/loongson/glibc”

A total of five tests are PASS, and the serial port does not display
CallTrace.

Youling.

