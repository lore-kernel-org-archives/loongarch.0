Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F213E8A0
	for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 09:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714123552; cv=none; b=oCrSFf6KQn0Fzu+V2pG8xO1GiGz7t42MlTUo3aFw/u5p7OR4riQClxxcOzPoWZ4bMCbbwcezKBunhDt+DIK0wXQGtSp6dcw+Dj0JUuy8/ms/8+1s9cxb5eQzmlmO3cXPqBJoH9qbCBh8j6OOhDHlUVNSkLA3d27esL8PUAxjZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714123552; c=relaxed/simple;
	bh=v/8fP7ljlfNYu8p9ZmxbNzZV08oGzX9HMMT08K/tl/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1e0D7Hk+VvbAAx9yKx4Bh5PGan2lgAh9yrLatArcT6q7k2A9B4pnQVsH6ZhDRmyUb9laLEDfoe0Kf147Cxt4QySCWwn+YohaM92DFzKpSFSPGg+yW5gREPB2OevcneZ3658iLol7EYZW7fzrFM48O117Ar1euDyeFLuCInIxnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rbt3MVZ4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rbt3MVZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714123550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aI+0tk0N0rfZ0+RaTapxWMbQJR8XZdeH/fzJ04k7BlA=;
	b=Rbt3MVZ4FQnKg5tOI9dG7xTKGOB4BYpiVu6CtX2CrKrvldVKOJIFminbzBDWezZpPiX9+e
	R+6Pc194t72XyUalq5HP8J9O+/90Jj3hs1+jVjpSltdwXmoHC18PGQhKbZKGpYNctmMBeD
	WJ3Hx7v5immdLJeJJ8P4qldXEAs16Xg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-3UC91MysMiWn-RM20XTuWQ-1; Fri, 26 Apr 2024 05:25:46 -0400
X-MC-Unique: 3UC91MysMiWn-RM20XTuWQ-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1e2a1619cfcso19136405ad.0
        for <loongarch@lists.linux.dev>; Fri, 26 Apr 2024 02:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714123545; x=1714728345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aI+0tk0N0rfZ0+RaTapxWMbQJR8XZdeH/fzJ04k7BlA=;
        b=Jvd+/v0k+FELNseGD8i3diKhCHNRKOt+ylHpgJNyhIgZ3j2DHEF/MyMDvCmfJkRKp2
         WwjgJMx/dboM4DVgkLaIe8b/6s39QZgyzh6+j53EV/fJxp0ymU+8kQZzrudSUPpb5SOz
         v8ZoRoEapsF4/IuVaNolY04RuYp9JkpxnpFax14vjj2hmzA2DY1ReeUVG63/IutIYLuN
         vvIdmbhNlbAeVfrQPqCkqsTymsdSNMErHaLNX+L4vle0hJjCdNFr6cbZzW1D4Sxk9Gy5
         tbK45AY82WN8d8ph91VVH2vqLVTzTo4oToHTsm2bNz1/yfkmms22pHg2qqSVG2wSC8ut
         +P8A==
X-Forwarded-Encrypted: i=1; AJvYcCVKFwK0FLYDhUEyqqPHB212E4ujxm9Fs0OFOZO1H00IzoWUTenJDajGfAgVDhxedEV93i3Lnxo5Jo6uRfVgp94U99FWdSmbVzkh
X-Gm-Message-State: AOJu0YxkkYG01qRrrgbhsJpjUiZuiOSDfyFPRZ5sv4dQu7Y0k6Dpu4eU
	v2DgnnsSBE4bqZgSuzD9WQDH3NsSZzjOTrk+FZF0EDqwDceGiuN7DDiS/Wq12SONKaPRA+miZvr
	ojGakCQ//DKciUVfrA1EbvEGnpk6S4Vp5aXR4mxpOo5HymaLAAKyJ5dcL2w==
X-Received: by 2002:a17:902:cec3:b0:1ea:482f:f41e with SMTP id d3-20020a170902cec300b001ea482ff41emr9963257plg.15.1714123545328;
        Fri, 26 Apr 2024 02:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvlGXSv/tKHY50Dw7+RKb6bmu/jV2eWJbng5XCKDvWXp8D8BnGzOt+jBjaEMTVQZ+CP26+DQ==
X-Received: by 2002:a17:902:cec3:b0:1ea:482f:f41e with SMTP id d3-20020a170902cec300b001ea482ff41emr9963218plg.15.1714123545006;
        Fri, 26 Apr 2024 02:25:45 -0700 (PDT)
Received: from [192.168.68.50] ([43.252.112.88])
        by smtp.gmail.com with ESMTPSA id r3-20020a170902be0300b001e27462b988sm15054500pls.61.2024.04.26.02.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 02:25:44 -0700 (PDT)
Message-ID: <0a96abc4-8205-447d-9e7d-03397de5ada8@redhat.com>
Date: Fri, 26 Apr 2024 19:25:36 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/16] ACPI: scan: switch to flags for
 acpi_scan_check_and_detach()
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
 <20240418135412.14730-8-Jonathan.Cameron@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240418135412.14730-8-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/24 23:54, Jonathan Cameron wrote:
> Precursor patch adds the ability to pass a uintptr_t of flags into
> acpi_scan_check_and detach() so that additional flags can be
> added to indicate whether to defer portions of the eject flow.
> The new flag follows in the next patch.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v7: No change
> v6: Based on internal feedback switch to less invasive change
>      to using flags rather than a struct.
> ---
>   drivers/acpi/scan.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

