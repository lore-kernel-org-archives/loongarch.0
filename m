Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D95913C9A0
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714124186; cv=none; b=DfKroqM5qsVxSUrVY0GEmxxXBEsaV0XWB9c0wAfJQX0hBjs9KIi0BO8tnhcJHYFLe61idWS8TvVip0ma/pMq36sN3iQwZzJ4B5ZoLatjrgq/ZxG2txktNOjRFp6vswHPkhULyoXPDJ4BjCiIN6eJ6SLpzGbJADuUZ+c6spnkrjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714124186; c=relaxed/simple;
	bh=Y3jENvyu7fKPEdBvKAbLTUiG9vM1ldEliX0y6fpkZxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYbW+hzwQ2XAC3JABjecvAJBTT2lwsmOuJAPdLsWaiwze2XPBfA9dH+G6kHWw7OFk/9uhzWK6k+e3KZzUHhoOjCV4p0LKHtd5g3WDTRb1B6ZQ5E+/Q4cO/PQDhcRz6KVzjnE5bxZ5mIeWF5cwCHvbEHY75sPV0UCgsQpqXhwFOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHAGGWk0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHAGGWk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714124183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qExq3Nq0hUqrQo4qRdmB4OoXaEaQNPNwgb/ED5v1FgA=;
	b=gHAGGWk0TQraD7CI69nORbQi0FwM1edbZ/LVAXE+x9GjKHh52VqWKi8WN4U8GZMZ6Ri0y5
	jO3xJTVsmaISi2Izf4H04TCsTT0/TwI0cebuBhc7dbdQy1t7Y56Coy31YoqKmc0D1jarpm
	L0AbLqMAYJ2/vNfFJoirQkQ7MyHAn8M=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-ubwfGlkcOeucEdX3joC1wQ-1; Fri, 26 Apr 2024 05:36:22 -0400
X-MC-Unique: ubwfGlkcOeucEdX3joC1wQ-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1e2bbb6049eso18152445ad.0
        for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 02:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714124181; x=1714728981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qExq3Nq0hUqrQo4qRdmB4OoXaEaQNPNwgb/ED5v1FgA=;
        b=c6hfvqPR4ZT1ekd0gEfqsgpwdZwCzImI+I9QeEe9vk+tF5Ms5/qGoO5WAbsKyc6kA2
         IojYuo+io6LQlnd+QRxnWqTf06QdMHnYq1N8rdFquvY/a/fDuKdNT3z/LULqFBGnRWS4
         UCkkTjl8ru7lp8QhGSBY/qVTNnIaY49EVvHqg92WYuZOpMbHSztE4GWyAUxOF25L4drK
         jd9Ur5i29sHWiFyMH0s2dfjUXSF961U1zQnhEFUDbg+JKDmIDwQoaxu6/IQ//9+8R75K
         t66yzDhLgJb8CH7LMuZYWZwXPOPJvgdNLlsBss/HJActZVuJcR00LgBbBB5YyKyzyvYy
         jSXg==
X-Forwarded-Encrypted: i=1; AJvYcCVEB78avPkMq89LpJa05jENt9Q+UXuuZBgjf9DrELjhTKZShI+foqTIM+0AiIXjGjfm1V8PNND/0dcf/2r5IBHWSWOyC156YdnN
X-Gm-Message-State: AOJu0YzpCwOTGyAVbmVpqB2fp2qROQfUX8S5lDJDUX6AHJBMxu8TPmew
	kEERaaDDBLh7qi1klNeS1BOrd09vj1a9nX+InxRlcSiwJExjbiclDxFZ169HvSx9VJ0jv4uMYOr
	/EnA956DNHddZqb0K5njw9zwoQ5TVLTDYiFLjh7eCidsqGLNGQgu58nWKng==
X-Received: by 2002:a17:902:e743:b0:1e9:13eb:9082 with SMTP id p3-20020a170902e74300b001e913eb9082mr2650401plf.0.1714124181183;
        Fri, 26 Apr 2024 02:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+kB8MtLlnQihsmOFiAsNTY4H/hnM+mV/Y1YJ7mzin6YbOqhwE6PJBBN0k7jOFD1Z7EzpxaA==
X-Received: by 2002:a17:902:e743:b0:1e9:13eb:9082 with SMTP id p3-20020a170902e74300b001e913eb9082mr2650377plf.0.1714124180801;
        Fri, 26 Apr 2024 02:36:20 -0700 (PDT)
Received: from [192.168.68.50] ([43.252.112.88])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e5c200b001e556734814sm15079254plf.134.2024.04.26.02.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 02:36:20 -0700 (PDT)
Message-ID: <e4628e32-8e76-4db4-9c85-b1246186f3be@redhat.com>
Date: Fri, 26 Apr 2024 19:36:10 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/16] arm64: psci: Ignore DENIED CPUs
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, x86@kernel.org, Russell King
 <linux@armlinux.org.uk>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Miguel Luis <miguel.luis@oracle.com>, James Morse <james.morse@arm.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxarm@huawei.com,
 justin.he@arm.com, jianyong.wu@arm.com
References: <20240418135412.14730-1-Jonathan.Cameron@huawei.com>
 <20240418135412.14730-13-Jonathan.Cameron@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240418135412.14730-13-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/24 23:54, Jonathan Cameron wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> When a CPU is marked as disabled, but online capable in the MADT, PSCI
> applies some firmware policy to control when it can be brought online.
> PSCI returns DENIED to a CPU_ON request if this is not currently
> permitted. The OS can learn the current policy from the _STA enabled bit.
> 
> Handle the PSCI DENIED return code gracefully instead of printing an
> error.
> 
> See https://developer.arm.com/documentation/den0022/f/?lang=en page 58.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> [ morse: Rewrote commit message ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v7: No change
> ---
>   arch/arm64/kernel/psci.c | 2 +-
>   arch/arm64/kernel/smp.c  | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
> index 29a8e444db83..fabd732d0a2d 100644
> --- a/arch/arm64/kernel/psci.c
> +++ b/arch/arm64/kernel/psci.c
> @@ -40,7 +40,7 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
>   {
>   	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
>   	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
> -	if (err)
> +	if (err && err != -EPERM)
>   		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
>   
>   	return err;
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 4ced34f62dab..dc0e0b3ec2d4 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -132,7 +132,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>   	/* Now bring the CPU into our world */
>   	ret = boot_secondary(cpu, idle);
>   	if (ret) {
> -		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
> +		if (ret != -EPERM)
> +			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
>   		return ret;
>   	}
>   

The changes in smp.c are based the assumption that PSCI is the only backend, which
isn't true. So we probably need move this error message to specific backend, which
could be PSCI, ACPI parking protocol, or smp_spin_table.

Thanks,
Gavin

