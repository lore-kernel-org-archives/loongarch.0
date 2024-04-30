Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030311CBD
	for <loongarch@lists.linux.dev>; Tue, 30 Apr 2024 04:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714451368; cv=none; b=R/4cc2SWy94v7LxbIXglokVef0OgfesWMzJvbOPZRVaQ7TkL5mvtZROaPEz9X/VTt3VHqSpUkskM4wKFQunfM39xNM8ZYwv6kbi70aUy8l58qdE6Brp/NrAkvljPQEUxvUnTwn1jjgQgXmu/ELeBKSYhT0wtpc7hF7E4IG7Qa6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714451368; c=relaxed/simple;
	bh=FEm1/PB329Jyi/kHvt9MX59QyNkI8IQyV5tTODOIcw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFqjbm1VXh7Vg/0Rk0GijDoXzaVry+69DLjqxeZDSMSTT7EyTicRdql2cPhsZvx8HyNah2R9oHs/SJZ4lWFApXVJSByZQ6dGQqQlCX+MCKhj+VSvkJOlph1lzqu8TwUxtyUHYq6dsZV9KTGlgW7lTEDvbShm4PcJtnC5EQURtXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LsBRgvgJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LsBRgvgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714451365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1/gI69YXA+wRBrAlMSJILQJim8W89y0vmUYfYeJ+kM=;
	b=LsBRgvgJg0DJY9hLiSKX3mvTo/b104JH3f1iJlOX1uHWgDdrtMwHIzQeZ+T2qFy/Agbbh2
	TxnJg+My2fVPPSh5M4MVqXMGeK15gkg973HL1K6bsPY/2yQgO8YfQWb7Z/k1Vf09+FsauN
	z9z6I5nqua/z+eatWEGYxG+Ifpch6j8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-dqQ33-RPMKeTyjtk5_YsYw-1; Tue, 30 Apr 2024 00:29:24 -0400
X-MC-Unique: dqQ33-RPMKeTyjtk5_YsYw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c5ed191fe3so7622722b6e.3
        for <loongarch@lists.linux.dev>; Mon, 29 Apr 2024 21:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714451363; x=1715056163;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1/gI69YXA+wRBrAlMSJILQJim8W89y0vmUYfYeJ+kM=;
        b=i0hSaXY2SDM+9HeIvo4RGcIpLzKWuN0SelCkLuWa759WcNRpE/dh1BO0uTJw++uDW0
         K5ciwSZzFkJQgK8enk2IpdewPpRE7TE9q8bSFD8l/k0LTOAGnyB9SIawlByYYjVYliRV
         XD0wcRzFPYPGsrFyW2sZIqRTXDVRpbPwL3C0MEsFTypaVdWCBpqnFndJozqMTaaTpR9o
         MjsYRH9R2E6yJzo/K1j3rrWdLgpms4K+mI/aSiE6x27l4dMlvPcW6Cpn1NdKgXSz2UPP
         cBnr3AbWAPm42tR8Gk9VbYcPn2iUpvknOxRaBlR83f43vYLjqQnYgS0z4K9ryCRehpGH
         yHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTy3uX9p2mIGoA09q/A8Ak1vl9SBOgH/jw+e8pigm9Z7pDCakbFS7AVR1NXM/ONgtoXz9Kvlu1y8cMy8NWsyZ5fa3TN3/Dvkvb
X-Gm-Message-State: AOJu0Yxs4ZxTqUamnqUxLwA0upYKukx8X45Vif9ysYyz9FGb+DmomCq3
	7KgapZ5sFIUf31Qx2irFGMr+5cYOqfruUtjpcVPC0vujOoW2mQ2LoFrenuNL5KrKaiQ7UupKsmx
	lgrxb8QX20vGSQUDDpfjo5Qj0bjSgKZRRTiTCIxJVVMJdJS05EoeiDgncyQ==
X-Received: by 2002:a05:6808:1b21:b0:3c8:42f1:40b2 with SMTP id bx33-20020a0568081b2100b003c842f140b2mr14918966oib.9.1714451363455;
        Mon, 29 Apr 2024 21:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEma/8noQWxcMSK7hzaRRVetUMUXvHfjFYfu5UCMsY0GiHyeLt76asSKvhJFyxiVUNt5H/EkA==
X-Received: by 2002:a05:6808:1b21:b0:3c8:42f1:40b2 with SMTP id bx33-20020a0568081b2100b003c842f140b2mr14918939oib.9.1714451363109;
        Mon, 29 Apr 2024 21:29:23 -0700 (PDT)
Received: from [192.168.68.50] ([43.252.112.88])
        by smtp.gmail.com with ESMTPSA id b16-20020a63d810000000b005e438fe702dsm19772604pgh.65.2024.04.29.21.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 21:29:22 -0700 (PDT)
Message-ID: <eaac4ff8-4e88-4f66-b4ab-975a5b77c3a9@redhat.com>
Date: Tue, 30 Apr 2024 14:29:11 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/16] arm64: psci: Ignore DENIED CPUs
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Hanjun Guo <guohanjun@huawei.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxarm@huawei.com,
 justin.he@arm.com, jianyong.wu@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20240426135126.12802-1-Jonathan.Cameron@huawei.com>
 <20240426135126.12802-13-Jonathan.Cameron@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240426135126.12802-13-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/24 23:51, Jonathan Cameron wrote:
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
> Note the alternatives to the PSCI cpu_boot() callback do not
> return -EPERM so the change in smp.c has no affect.
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
> v8: Note in commit message that the -EPERM guard on the error print
>      only affects PSCI as other options never use this error code.
>      Should they do so in future, that may well indicate that they
>      now support similar refusal to boot.
> ---
>   arch/arm64/kernel/psci.c | 2 +-
>   arch/arm64/kernel/smp.c  | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 

Thanks for the check and clarification that -EPERM is only sensible
to PSCI. With the clarification:

Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin

