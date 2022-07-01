Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F16D1850
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1656693442; bh=BSohsvmD5egGH+mMv/WusSgBQ2gB+6qWrNoArEj34uE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aENPBhooUKD7yV0sNXOyZrW0mVnNrqWTQBMkLgyaOXHrg6JylAn8vjqLBXNaUzszu
	 hVitKJdlpAoSgletz+LyP6SLtMVF6iAFXe4AHfoS4gZmXZ5K/JztUagaGGEYVxE5hD
	 gHSbFn6kPy5u8SX9JOMnz1gYzq4YPkSuFtKpsahM=
Received: from [192.168.9.172] (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0F3D46010B;
	Sat,  2 Jul 2022 00:37:22 +0800 (CST)
Message-ID: <4f874205-d004-fa00-6fe0-b959ba21c186@xen0n.name>
Date: Sat, 2 Jul 2022 00:37:21 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0a1
Subject: Re: Building loongarch64 toolchain
To: Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev
References: <f83d6a9d-ec07-21d1-87e3-700475192694@roeck-us.net>
 <CAAhV-H41pxiYudNRYOYK8hndMA2Ki6VUXxSaqa27yME1mjWjgw@mail.gmail.com>
 <9427ebf1-8b5a-cebc-6ec4-2414197c24a8@roeck-us.net>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <9427ebf1-8b5a-cebc-6ec4-2414197c24a8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 7/1/22 14:39, Guenter Roeck wrote:
> On 6/30/22 19:14, Huacai Chen wrote:
>> Hi, Xuerui,
>>
>> On Thu, Jun 30, 2022 at 10:06 PM Guenter Roeck <linux@roeck-us.net> 
>> wrote:
>>>
>>> Hi,
>>>
>>> I have been trying to build a toolchain for loongarch64 using gcc 
>>> 12.1.0 and
>>> binutils 2.38. Unfortunately, the resulting toolchain doesn't work 
>>> for me.
>>> Tracking down the problem, it turns out that gcc passes -mabi=lp64d 
>>> to the
>>> assembler, but the assembler only supports -mabi=lp64.
>>>
>>> Where can I find guidance on how to build a working toolchain ? 
>>> Using the
>>> available toolchain binaries is not an option.
>> Could you please give some guidance?
>>
>
> I ended up hacking binutils to accept all lp64 mabi variants.
>
> --- binutils-2.38.orig/gas/config/tc-loongarch.c    2022-01-22 
> 04:14:08.000000000 -0800
> +++ binutils-2.38/gas/config/tc-loongarch.c    2022-06-30 
> 07:41:29.545038901 -0700
> @@ -142,7 +142,8 @@
>    switch (c)
>      {
>      case OPTION_ABI:
> -      if (strcasecmp (arg, "lp64") == 0)
> +      if (!strcasecmp (arg, "lp64") || !strcasecmp (arg, "lp64d") ||
> +          !strcasecmp (arg, "lp64s") || !strcasecmp (arg, "lp64f"))
>      {
>        LARCH_opts.ase_abi |= EF_LOONGARCH_ABI_LP64;
>        LARCH_opts.ase_ilp32 = 1;
>
> With that, I am able to compile loongarch:defconfig. I'd still like
> to understand the problem and avoid the hack, though.

This is due to an incompatible change to the LoongArch toolchain 
convention spec (the first version was like [1], got criticized mainly 
by me, then morphed into the final take [2], all discussion was in 
Chinese though), after the initial port went public and got accepted by 
binutils upstream. The binutils trunk has already been updated; in 
particular, you want at least [3] for compatibility with gcc.

BTW, you could use the Gentoo toolchain for easy experimentation if 
that's acceptable for you. (I maintain the Gentoo/LoongArch port so I 
know that toolchain is working for most commonly encountered software. 
It's probably carrying more downstream patches than some of you would 
prefer, although I don't find that to be a problem so far.)

[1]: https://github.com/loongson/LoongArch-Documentation/pull/23
[2]: https://github.com/loongson/LoongArch-Documentation/pull/24
[3]: 
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=3b14682a432e61c756ec9ad0b5bf5f8136e2cdce

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

