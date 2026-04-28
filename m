Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925B3E274B
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370960; cv=none; b=AbXRGG7e1fAosIhlba64SfCVxewUYb0MZyXrzb6AW6LQ7bvI93roI5VLBfWK5I/YWTdvReiUz5LOC43DpmFpp0dx0tyGPoo6VyNhBmYlW7NV/Ly2NLvkTX6LQQKtYlXxM5k0+at3dQj2Atg138j3E5MGMZcXDaLpbRH9HCU011w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370960; c=relaxed/simple;
	bh=sOR6gsJL7r5rOSL8x52mZWfcCwvsBn48HjGOk8jdykE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XK2LdSJCnP/aw5+WO2zXRkQYRhPqm1tI2JPJAUzl7WYKxjbxi41BKx+Qwtid0x20OIlXsInc7voEJryhl1OUVZ+eNHO3nyNtCWAHQtzKWgytnxyXis5I4v18XcSjBhNT9O43HUXQMhqXOUg/MP8R7/Ax4lEiN8Pq6klDolEaxBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Ayc9ILpq; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Ayc9ILpq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777370924;
	bh=l3ZItNC4ZEE7HINfmOiQ+2CZX7SHKa/qFf/oCQ9+rMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Ayc9ILpq5ox+EpXYZ6kjVdqiVMxPfYIlLImoQbPttvbw9HwFwErHcRmKxTpM5Lu83
	 7cfMW98WPkzJuICiat4IYLqmJhRkxNQhIC2pGUK+NdByqaFW3zr+0MiOrqCJk2Menr
	 k6qwj0APP5F4LSkuHwYniRj8Bgz+72+7cSKrpo+o=
X-QQ-mid: zesmtpgz4t1777370917tb218b79b
X-QQ-Originating-IP: pB0d/s3ztDnIwxWmmjZWYBo12UVJupMeUO76AEYke1M=
Received: from [10.10.73.115] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Apr 2026 18:08:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9400796753880945299
Message-ID: <31529056B7CF466A+6fc02cf2-cb43-4047-90ec-cd5e412ca5f7@uniontech.com>
Date: Tue, 28 Apr 2026 18:08:36 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Refactor the Features output in show_cpuinfo()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260428075231.2283151-1-maqianga@uniontech.com>
 <CAAhV-H4i-0-yTsb9UZh3M0rr_bd-FO66wK9Q85RuDmH8M2ZArQ@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAAhV-H4i-0-yTsb9UZh3M0rr_bd-FO66wK9Q85RuDmH8M2ZArQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NFNrK8KlcSCR4UAMP4NBwSFmy8GXlTLGonVRp6MSEkCsMxI48qdd/xeD
	1rMyW7d9nHSRJbsHzXyPNly2v+UzBr7SqR6EEHBG1nuBKSLE9lybkOHoAwlNlFIUaTpnx5o
	9Sq/fvSTzgG+W9LVYErvopfsuYdNdE6TtFObuMMIps5VlZgdd4iE0s3xw8AJOqXuN5J9h+s
	APZ4XKocj6yLaSkLZK/pg4c5Mlpr+t2p0GU2JL7vFURvMHeY7zxi9d8ws85n2LwLU+P42IG
	ptbJrP8mAG+niw+PqIwmJGPdHZqMN7CMaEcVQ6xQW9P6b+30KY+FC23vzOPtLkQyk01jcF/
	b4uuGObeCRC8P5zCjUB6X/Mf5hJVKKepFFUO86pmFAPP77QAcqYRl5wFmrtSokMo3ZaXjqU
	foKEOUOtZrKhUhGAooM5NrI71Z0/c1xGDtEs7mzkTHIWIimtW4IA8dJZNIeU4/PGFyh+dcX
	d7AufbTDxN5hnBmQECuR9VojMBU8wEWccIGe2FOdX2QrrRgI/jIOhSrboBS2rcLG+1atJGP
	8xY5udGj8tYQYi/Q8ZOebwzT8at+dztis3+sE/Q4qNYUMwAJmzpIB3RGUGS2uvBUhTz+B8d
	omtePriHBRiIC2hb9qzDrpTqdn6joTYMEiYv6KBfExYdCT4NPvgqzxzkp60GWE4FcntQViN
	n+45t3/zjw9SsyxD7SR2AvyxVOxGt5p+IcDGafJVZbCMwCw6sKw5kFUCX6Ia3gOPpnTDwVh
	AixtAbgJ+cGkMz0EIAU7vLd4eNzre/IHoOSg/DcC+r3Nwu2q5NHLG6oo5B+DFrG8K93oqWk
	VcbCfZgCxr83T7fZIsn8N9T09L0wYmAmjsizsSYlEZpx60OJnegJ51syDU3o7ahP9Pr8bit
	1m2uqeCJYbnGadmu4cChC65RLa4uy7veG+yhryaBmwYizN8GlJMVPtGzEveqcydbxoFhBH9
	nBCrekhipFKuN3OIh1HxULCb7VoQf4APqNQyxcETkFXwShCMMLXARyjS1SDpWFsz+GZ1tzr
	JNvvWgt9vgmWdE6Iugx8uQFgWB0VEk5JHNZctpu+a5njllFDmLxBpnmjkdHemmxnp8MzbGl
	Q==
X-QQ-XMRINFO: MSVp+SPm3vtS3p2ntzY1PNspv37mS5ZT3g==
X-QQ-RECHKSPAM: 0


在 2026/4/28 17:37, Huacai Chen 写道:
> https://lore.kernel.org/loongarch/20260228102946.4045-1-dongtai.guo@linux.dev/
> https://lore.kernel.org/loongarch/20260428075231.2283151-1-maqianga@uniontech.com/T/#u
>
> What make you modify here again and again?
Sorry, I didn't notice that the relevant patch had already been submitted.
> Is this function ugly?
> Is this function has bugs?
No
> Or for some other reasons?

I noticed that with the addition of new features to the LoongArch 
architecture,

new features can be conveniently added without constantly needing to add 
if statements, keeping the code concise.

>
>
> Huacai
>
> On Tue, Apr 28, 2026 at 3:53 PM Qiang Ma <maqianga@uniontech.com> wrote:
>> 1. Adds an hwcap_str[] mapping table, using KERNEL_HWCAP(x)
>> (i.e., const_ilog2(HWCAP_LOONGARCH_x)) to map HWCAP bits
>> to corresponding strings;
>> 2. In show_cpuinfo(), iterates through hwcap_str in a loop,
>> checks the bitmap of elf_hwcap, and prints the corresponding
>> feature names;
>> 3. Maintains the original output semantics (still printing
>> the same feature names) to facilitate adding new CPU features
>> in the future.
>>
>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>> ---
>>   arch/loongarch/kernel/proc.c | 60 ++++++++++++++++--------------------
>>   1 file changed, 26 insertions(+), 34 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
>> index d4ce5b585453..1188bffd66b6 100644
>> --- a/arch/loongarch/kernel/proc.c
>> +++ b/arch/loongarch/kernel/proc.c
>> @@ -12,9 +12,32 @@
>>   #include <asm/idle.h>
>>   #include <asm/processor.h>
>>   #include <asm/time.h>
>> +#include <asm/cpufeature.h>
>> +
>> +#define KERNEL_HWCAP(x)  const_ilog2(HWCAP_LOONGARCH_ ## x)
>> +static const char *const hwcap_str[] = {
>> +       [KERNEL_HWCAP(CPUCFG)]          = "cpucfg",
>> +       [KERNEL_HWCAP(LAM)]             = "lam",
>> +       [KERNEL_HWCAP(LAM_BH)]          = "lam_bh",
>> +       [KERNEL_HWCAP(UAL)]             = "ual",
>> +       [KERNEL_HWCAP(FPU)]             = "fpu",
>> +       [KERNEL_HWCAP(LSX)]             = "lsx",
>> +       [KERNEL_HWCAP(LASX)]            = "lasx",
>> +       [KERNEL_HWCAP(CRC32)]           = "crc32",
>> +       [KERNEL_HWCAP(COMPLEX)]         = "complex",
>> +       [KERNEL_HWCAP(CRYPTO)]          = "crypto",
>> +       [KERNEL_HWCAP(LVZ)]             = "lvz",
>> +       [KERNEL_HWCAP(LBT_X86)]         = "lbt_x86",
>> +       [KERNEL_HWCAP(LBT_ARM)]         = "lbt_arm",
>> +       [KERNEL_HWCAP(LBT_MIPS)]        = "lbt_mips",
>> +       [KERNEL_HWCAP(PTW)]             = "ptw",
>> +       [KERNEL_HWCAP(LSPW)]            = "lspw",
>> +       [KERNEL_HWCAP(SCQ)]             = "scq",
>> +};
>>
>>   static int show_cpuinfo(struct seq_file *m, void *v)
>>   {
>> +       unsigned int i;
>>          unsigned long n = (unsigned long) v - 1;
>>          unsigned int isa = cpu_data[n].isa_level;
>>          unsigned int prid = cpu_data[n].processor_id;
>> @@ -60,40 +83,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>>          seq_puts(m, "\n");
>>
>>          seq_puts(m, "Features\t\t:");
>> -       if (cpu_has_cpucfg)
>> -               seq_puts(m, " cpucfg");
>> -       if (cpu_has_lam)
>> -               seq_puts(m, " lam");
>> -       if (cpu_has_lam_bh)
>> -               seq_puts(m, " lam_bh");
>> -       if (cpu_has_scq)
>> -               seq_puts(m, " scq");
>> -       if (cpu_has_ual)
>> -               seq_puts(m, " ual");
>> -       if (cpu_has_fpu)
>> -               seq_puts(m, " fpu");
>> -       if (cpu_has_lsx)
>> -               seq_puts(m, " lsx");
>> -       if (cpu_has_lasx)
>> -               seq_puts(m, " lasx");
>> -       if (cpu_has_crc32)
>> -               seq_puts(m, " crc32");
>> -       if (cpu_has_complex)
>> -               seq_puts(m, " complex");
>> -       if (cpu_has_crypto)
>> -               seq_puts(m, " crypto");
>> -       if (cpu_has_ptw)
>> -               seq_puts(m, " ptw");
>> -       if (cpu_has_lspw)
>> -               seq_puts(m, " lspw");
>> -       if (cpu_has_lvz)
>> -               seq_puts(m, " lvz");
>> -       if (cpu_has_lbt_x86)
>> -               seq_puts(m, " lbt_x86");
>> -       if (cpu_has_lbt_arm)
>> -               seq_puts(m, " lbt_arm");
>> -       if (cpu_has_lbt_mips)
>> -               seq_puts(m, " lbt_mips");
>> +       for (i = 0; i < ARRAY_SIZE(hwcap_str); i++)
>> +               if (elf_hwcap & (1 << i))
>> +                       seq_printf(m, " %s", hwcap_str[i]);
>>          seq_puts(m, "\n");
>>
>>          seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
>> --
>> 2.20.1
>>
