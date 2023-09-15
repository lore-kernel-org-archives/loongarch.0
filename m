Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8DD2FB
	for <loongarch@lists.linux.dev>; Fri, 15 Sep 2023 08:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1694765763; x=1695370563; i=deller@gmx.de;
 bh=OR4Did5RevJvBurZYl1SM45SkH4oF0Uw+9Fs3Z+P5S4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ue7n/uwnKIjgWZxLTfz/ltkccdPw9sl1fbNQJOdbfZ1ZcyCAAW1SRnZgWl3Liyv4A3/ZDDTUeNg
 57Fgf2m9PrZVEwi604Rly6pkjyxPmDKMZo4F4Qnjl90Waggz/SZ1bNENZhvtbITbtjNQKQCeJaw0D
 0PsD5q6GVG1bRq0HyGB1ulRExc0uJPyKtRzGbZlZgAHrxZDeWhuYPwKj3QKvMm4o4LYX6BqzhKV/G
 jxh5tvrm/djqKgdfWAGIA6HmvwZFBxHmcNbhOOL5hG0oSlRk89BuO5ghOi9SDbIVdQw4uPAWeTyrm
 AnZJ1/vE5W9Q1mM3shgYTJIObdpg4hjN34FQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.117]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O2Q-1qiixJ250A-003sUe; Fri, 15
 Sep 2023 10:16:03 +0200
Message-ID: <b1c729bf-86b9-8a1f-c6af-a69be2b4a44c@gmx.de>
Date: Fri, 15 Sep 2023 10:16:01 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] LoongArch: Fix lockdep static memory detection
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Guenter Roeck <linux@roeck-us.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
References: <ZQC5jS/Kc/JiBEOa@p100>
 <CAAhV-H56oqmQhA1PKh3E6z0A04qfRPehQ8ATOiirAU2O+z=fgw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAAhV-H56oqmQhA1PKh3E6z0A04qfRPehQ8ATOiirAU2O+z=fgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l9KjxxyKl6giIE9PfdGvuKtuG2ugvajJsOLnRAlh3ewEEEseOsw
 E9XCYhPbB5r0g34yeYKGNJcBwSQk57JJjIRl3stdCSldzXMtkwu20W9BSyrAJzO5Cn+Os+X
 sp54eGw5pR3TP8oMV2g5XyiSp/DQLEQvcXfS1SYLRnFlDQX1gEuGqZWb2frLq2lZSRwFHDG
 6Fa3YTbivgcwPkv9uiMEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gt1o4ZAoBw8=;N09JFBEvb6hmz+trAVjvOfJf0H4
 bXhoE+M6a//MR10T/THDV+S7W1/fe3rI5Y/lZJg8e+MX0VHDlu/Qc4+Cjc6mF/L0Bp2O9F9IP
 HVjkjL014tHWcT8oWUbFhfPkGnI2JT8LIfDfJSUnMN8sguhK4PreI0CVdc664d7bA1DZ8GlEd
 M9sGYvQWTSm13tgQ9YgiR5w5noUl+CKBkw0r2Bz3YmK7dtiyuUNX1VHJBeRHov85jCRt9TlGV
 GmDc5cJxk3TgPNLrjBOKii44dJzu0BIYYiLUafzF2T7iZ40h1LZH5RSD6khqpTQRRhf/Zbi4t
 +KbgSYZgeq61MqjikiOAvC1L9MGZtTbN7bTzB3EDHhBt1oBqXwloRVNRnVPWTqKQFVofKu3tm
 k6f1O8OUbyCwOyzWINk2LlFS9voZxh1ne8iCTomSFISJJsy9HVWtTZj49BAu8eViooP/fwJe5
 n0LmjAB3wOEK4B3Iprf2jgIblBkAD3svuVXm0iFEhI3PmE1LRR8yQJO2TCIvafuM+RDI1vcTq
 Wqa7Wh5QHKTshyx3S80UOhkumRn4q2+Ce8MCW5FjyuhFi1XRbW4aIPcZjguuYa9QP2YQgwF4j
 wjBuUkDdLloYbTANtAlb4TwDCrRW5Sl0snqj15ZMlx8vwHydrI2iimSRv+mDAWeonsv1ppQnh
 Hab6cdqB5AFUXtjFMobxV0w5vgXb02zMRtqvWBggfAgvi3u2O37fDbJobAH21dxTeUseKyqsG
 MlDPL7BKABOvMYpnn8Vz5OX1nPvgO8dfkrFruh62ITSeSDMgfQPqcsX17JzU70TrVHv1SysqZ
 2h3rooeOfjGOooJGbbPrkhx+sDKaltinrUnkSFIo/9q3z2chM8bZuXVvMoWdr1ymgxs0d2m0r
 i25OT1TgpK+ggDGF1wkFlU4gkzvBVJj1DE7N4r08b3xdySqaiGJWNKpuF6L5+8OSgafj2xKwk
 9YDsyd7jNcSTelccaQHJTUuoRYM=

On 9/15/23 05:22, Huacai Chen wrote:
> Hi Helge,
>
> On Wed, Sep 13, 2023 at 3:18=E2=80=AFAM Helge Deller <deller@gmx.de> wro=
te:
>>
>> Since commit 0a6b58c5cd0d ("lockdep: fix static memory detection even
>> more") the lockdep code uses is_kernel_core_data(), is_kernel_rodata()
>> and init_section_contains() to verify if a lock is located inside a
>> kernel static data section.
>>
>> This change triggers a failure on LoongArch, for which the vmlinux.lds.=
S
>> script misses to put the locks (as part of in the .data.rel symbols)
>> into the Linux data section.
>> This patch fixes the lockdep problem by moving *(.data.rel*) symbols
>> into the kernel data section (from _sdata to _edata).
>>
>> Additionally, move other wrongly assigned symbols too:
>> - altinstructions into the _initdata section,

> I think altinstructions cannot  be put into _initdata because it will
> be used by modules.

No.
arch/loongarch/kernel/vmlinux.lds.S is used for the static parts of the ke=
rnel
and altinstructions are replaced before modules are loaded.
For altinstructions in modules the linker script scripts/module.lds.S is u=
sed.

Helge


>> - PLT symbols behind the read-only section, and
>> - *(.la_abs) into the data section.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Fixes: 0a6b58c5cd0d ("lockdep: fix static memory detection even more")
>> Cc: stable <stable@kernel.org> # v6.4+
>>
>> diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kerne=
l/vmlinux.lds.S
>> index b1686afcf876..bb2ec86f37a8 100644
>> --- a/arch/loongarch/kernel/vmlinux.lds.S
>> +++ b/arch/loongarch/kernel/vmlinux.lds.S
>> @@ -53,33 +53,6 @@ SECTIONS
>>          . =3D ALIGN(PECOFF_SEGMENT_ALIGN);
>>          _etext =3D .;
>>
>> -       /*
>> -        * struct alt_inst entries. From the header (alternative.h):
>> -        * "Alternative instructions for different CPU types or capabil=
ities"
>> -        * Think locking instructions on spinlocks.
>> -        */
>> -       . =3D ALIGN(4);
>> -       .altinstructions : AT(ADDR(.altinstructions) - LOAD_OFFSET) {
>> -               __alt_instructions =3D .;
>> -               *(.altinstructions)
>> -               __alt_instructions_end =3D .;
>> -       }
>> -
>> -#ifdef CONFIG_RELOCATABLE
>> -       . =3D ALIGN(8);
>> -       .la_abs : AT(ADDR(.la_abs) - LOAD_OFFSET) {
>> -               __la_abs_begin =3D .;
>> -               *(.la_abs)
>> -               __la_abs_end =3D .;
>> -       }
>> -#endif
>> -
>> -       .got : ALIGN(16) { *(.got) }
>> -       .plt : ALIGN(16) { *(.plt) }
>> -       .got.plt : ALIGN(16) { *(.got.plt) }
>> -
>> -       .data.rel : { *(.data.rel*) }
>> -
>>          . =3D ALIGN(PECOFF_SEGMENT_ALIGN);
>>          __init_begin =3D .;
>>          __inittext_begin =3D .;
>> @@ -94,6 +67,18 @@ SECTIONS
>>
>>          __initdata_begin =3D .;
>>
>> +       /*
>> +        * struct alt_inst entries. From the header (alternative.h):
>> +        * "Alternative instructions for different CPU types or capabil=
ities"
>> +        * Think locking instructions on spinlocks.
>> +        */
>> +       . =3D ALIGN(4);
>> +       .altinstructions : AT(ADDR(.altinstructions) - LOAD_OFFSET) {
>> +               __alt_instructions =3D .;
>> +               *(.altinstructions)
>> +               __alt_instructions_end =3D .;
>> +       }
>> +
>>          INIT_DATA_SECTION(16)
>>          .exit.data : {
>>                  EXIT_DATA
>> @@ -113,6 +98,11 @@ SECTIONS
>>
>>          _sdata =3D .;
>>          RO_DATA(4096)
>> +
>> +       .got : ALIGN(16) { *(.got) }
>> +       .plt : ALIGN(16) { *(.plt) }
>> +       .got.plt : ALIGN(16) { *(.got.plt) }
>> +
>>          RW_DATA(1 << CONFIG_L1_CACHE_SHIFT, PAGE_SIZE, THREAD_SIZE)
>>
>>          .rela.dyn : ALIGN(8) {
>> @@ -121,6 +111,17 @@ SECTIONS
>>                  __rela_dyn_end =3D .;
>>          }
>>
>> +       .data.rel : { *(.data.rel*) }
>> +
>> +#ifdef CONFIG_RELOCATABLE
>> +       . =3D ALIGN(8);
>> +       .la_abs : AT(ADDR(.la_abs) - LOAD_OFFSET) {
>> +               __la_abs_begin =3D .;
>> +               *(.la_abs)
>> +               __la_abs_end =3D .;
>> +       }
>> +#endif
>> +
>>          .sdata : {
>>                  *(.sdata)
>>          }

