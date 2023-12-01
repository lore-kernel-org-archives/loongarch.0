Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D0F63D1
	for <loongarch@lists.linux.dev>; Fri,  1 Dec 2023 03:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WGu4YqHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701402555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IO8CL2qjeIUr0LsYwreVkjK8516DQtyOeewHK7H786o=;
	b=WGu4YqHA2ly7lIBRb5cmtWLi5WqsiTeGBSOgibj+nx4++AXyK7ZsEtv2GYNHC2kyyWjipB
	yfENv9zdCkglh41tmGkeQTVkU716gjXy1Imt0DaVvIn14xh4uR/2vgPO83XBmn2z/DmeoP
	bx0ooj+aQf6f1CAztnw2y3tD3Gym1HY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-2gwYEP2uPTKCzYYdSctK_w-1; Thu, 30 Nov 2023 22:49:13 -0500
X-MC-Unique: 2gwYEP2uPTKCzYYdSctK_w-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cfcf1e9442so1556235ad.3
        for <loongarch@lists.linux.dev>; Thu, 30 Nov 2023 19:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701402552; x=1702007352;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IO8CL2qjeIUr0LsYwreVkjK8516DQtyOeewHK7H786o=;
        b=Bvh62/B6SxoPwkiG5yO7VXUWEAZGTWCpBgv4HxjaGprgnXZTdkUkAf36fyG0lm14Vv
         NufOOHGYAlBXVxMOvGFnWmoWjSWmX6sJixCIi8aRnM1lq5wDpVPpjmwHzrk76Xr0XiXY
         K4jD31UKYUiWB4pS6TwVG/cUkVaGFHosybS6d0+HoTeD7Y4mMLXU8N3gjXRzXyvCRs9R
         KVs8xwiyoCDMdMFSfIZnNhNqgdAkdFaqfw8XZfE5IlUhKTlTGDVxbBOslInArAx47FxY
         IkAMRdi9d/NgN5YiQ0I55WAjzY7cfrvqqS3CEH300Yx0tckWBVCEjZJl5ijj9n064bUp
         AeOg==
X-Gm-Message-State: AOJu0YyMyBfKOhQB5ePCGK9Cp2IDlBB5Vwz2yQfVxlB7+2T2tbl6jOiv
	Nst4XceZV0/tKBVT87AIdXnI8PH0wQaC3K/s8D4UvB5wrn34LAMNUjd2NakzLiSuPk7pAZh/RAK
	ezRjJWk3NhrkzF7AgsDAt
X-Received: by 2002:a17:902:e80e:b0:1cf:daca:2b5e with SMTP id u14-20020a170902e80e00b001cfdaca2b5emr17322871plg.38.1701402552355;
        Thu, 30 Nov 2023 19:49:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVVbr2zUe8qqYTBkmHgB1fO8oP/OS0GFEHLzxacC4remFDnJNuIkfv1IWdcQ4cpeu8xrZWrg==
X-Received: by 2002:a17:902:e80e:b0:1cf:daca:2b5e with SMTP id u14-20020a170902e80e00b001cfdaca2b5emr17322834plg.38.1701402551963;
        Thu, 30 Nov 2023 19:49:11 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902e74500b001cfc1a593f7sm2185691plf.217.2023.11.30.19.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:49:11 -0800 (PST)
Message-ID: <e0b38120-8b09-4695-974c-f3c3ef226f22@redhat.com>
Date: Fri, 1 Dec 2023 14:49:03 +1100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] drivers: base: Print a warning instead of panic()
 when register_cpu() fails
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R3W-00CszU-GM@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r5R3W-00CszU-GM@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/22/23 00:44, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> loongarch, mips, parisc, riscv and sh all print a warning if
> register_cpu() returns an error. Architectures that use
> GENERIC_CPU_DEVICES call panic() instead.
> 
> Errors in this path indicate something is wrong with the firmware
> description of the platform, but the kernel is able to keep running.
> 
> Downgrade this to a warning to make it easier to debug this issue.
> 
> This will allow architectures that switching over to GENERIC_CPU_DEVICES
> to drop their warning, but keep the existing behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

