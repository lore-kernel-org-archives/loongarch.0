Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529FBC144
	for <loongarch@lists.linux.dev>; Mon, 13 Nov 2023 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="My2WWweh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699848248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MtNFooCff3vqCOUxCEz1jHRl+QbfPpBEZibpqDAaoCg=;
	b=My2WWweh8U1qeObJ2g8zEcXNUI3TkqsggCEzixeElxmoQdy9Y0p/zLrGDs8eAaiq986wyy
	tFDOmuaB151AckTRLL/7euer1gy1Q4KuI6TGkXwWmfWSSASAyVOCsoJu5pzkpKsa/rKlJq
	GoLqHp3i9DcI9xYrLaxKz/BOm3uFtsg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-j1Sp9FT-PzeELTCxaqxoTQ-1; Sun, 12 Nov 2023 23:04:04 -0500
X-MC-Unique: j1Sp9FT-PzeELTCxaqxoTQ-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1cc5c4972bdso54517225ad.1
        for <loongarch@lists.linux.dev>; Sun, 12 Nov 2023 20:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848243; x=1700453043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtNFooCff3vqCOUxCEz1jHRl+QbfPpBEZibpqDAaoCg=;
        b=qK4IfGWU8pCAgMUqxSIB89heOwxVzKloLeCiCVsnzSfk2IGTxPqUf0QwUcAWkhOGby
         lHS9WYzV41NdGOlhnsG+w8g/gYJikrG6DqXu1s8SN3mLxb1AEU/N+gE9XeYJ0hDjxcJ+
         QFYaAIdbSEUA3FKHvvkxicNYvelMg/eMtuXxYxMGgLQY154YFAUbNMibw22kz34R8/sD
         Klay/MNttwSMnQosdCo8Pff+jN25y361LPxUMV8V07t5GGFNGB/t2hYs8YrWxBliweKp
         mfXUUvdD55mFBGcGwXXSyD0opU1W4sZ5eq6b9SNOoBk3g4l1VNmWBIeozWOnRcZ2MCxJ
         kouw==
X-Gm-Message-State: AOJu0Yz5lFcQXlTuqa41m7XukMpRvyaOAus7Ez0P0O5b4yIsJU9l+9rP
	P7dXDb55hXLuW+Rj61dYvmsRtXHoAFU6dzLnJ5uU0/Rah1UKRm3FXggdAVFJjQnCbLJdigKFLVA
	lUrhZ8TAVt04x+goRfY3/
X-Received: by 2002:a17:903:124b:b0:1cc:3f10:4175 with SMTP id u11-20020a170903124b00b001cc3f104175mr7395301plh.28.1699848243617;
        Sun, 12 Nov 2023 20:04:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIUBgi1/lc4Y3idUGi3EHadW6QYxPGSgwR1L+ZBVEJt2K4HesJHzLX8fXA3t0WRPADwpmGUg==
X-Received: by 2002:a17:903:124b:b0:1cc:3f10:4175 with SMTP id u11-20020a170903124b00b001cc3f104175mr7395280plh.28.1699848243280;
        Sun, 12 Nov 2023 20:04:03 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id u18-20020a170902e5d200b001c62d63b817sm3216342plf.179.2023.11.12.20.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:04:02 -0800 (PST)
Message-ID: <c4a0af68-153e-41a8-ae82-8ebb2b4c4bc9@redhat.com>
Date: Mon, 13 Nov 2023 14:03:53 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/22] drivers: base: Print a warning instead of
 panic() when register_cpu() fails
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
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 20:30, Russell King (Oracle) wrote:
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
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

