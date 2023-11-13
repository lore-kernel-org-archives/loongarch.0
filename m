Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F32C2C2
	for <loongarch@lists.linux.dev>; Mon, 13 Nov 2023 04:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kkf7OvIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699848574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2bRjfP7yOuv9SAdAE0QP2CBFoAYrMs60Lu0SjYCCHg=;
	b=Kkf7OvITFLR4Fo23BraMC3KkiyIUbPokUzEsWTCAO0iGCFdUJF/I/m4JNuRvxx1foY33fP
	YcwEiC5nl7n+Ymp4eOYJgNIfRzJ/huGbVt67z1hsbIbI1f3/v1t35CVAHwT+FzpBJL4Tse
	8zA4hWEMfZ4LpT7nXYuBXINkfEV4gQE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-c4pNUMutNCC8rWnZHCvA8w-1; Sun, 12 Nov 2023 23:09:33 -0500
X-MC-Unique: c4pNUMutNCC8rWnZHCvA8w-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-280351c9fa1so4045299a91.3
        for <loongarch@lists.linux.dev>; Sun, 12 Nov 2023 20:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699848572; x=1700453372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2bRjfP7yOuv9SAdAE0QP2CBFoAYrMs60Lu0SjYCCHg=;
        b=l90x2yZ/GnjruJCxefCrZ0KaiHOPi/hXiQ16S698Zy5KWaERouDIkCCminhNJYyWsJ
         S4eLoO+oC+3x1yeCeKq+V0+aL/KTZmNDuWPheEfmFuiiO6mvCUt+lL/++QdnWxzKtzVE
         GzaNj86vj/40Tlk/AHWAQU1KPvV1zYOIPHXy/ZYSf6Wkdnkiobh3lZrr4TBjIYu1wHoS
         xubhlNWWgRLG0XR/dcIqUqmMwfRMvN70D33EXYxSaZcZrM2p9UN1Gg1XkiJsbw9hMw9u
         Nd+5b1iWfYu5gSizY+L0K1YEkzFhVwBwGJw493nkP/muRlHkNMnC9xb8VNLqtaUc4Bbv
         ZCzA==
X-Gm-Message-State: AOJu0YwKAZcb80rEMAA8OjIYVA/3YnmaUUmcjKhiTgg82KE+bt7WnxvV
	uvIJBipu0cL6mCxNVQrIn6M+Yk9p98PmSP4//RW+7PLeRoWg+JVwwC0AMqBRXj/PJ2eUPUQ+2fd
	3aPyiA0thMK1bL9rDHMi8
X-Received: by 2002:a17:90b:1a8c:b0:27d:ba33:6990 with SMTP id ng12-20020a17090b1a8c00b0027dba336990mr3197176pjb.10.1699848572567;
        Sun, 12 Nov 2023 20:09:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2k5SwVakWG7zKK4WUWbKBo4uYLTXEgbcXMEekUsR8f4+eMr6ksf4A21GkOdsMSomj6DSw2A==
X-Received: by 2002:a17:90b:1a8c:b0:27d:ba33:6990 with SMTP id ng12-20020a17090b1a8c00b0027dba336990mr3197155pjb.10.1699848572281;
        Sun, 12 Nov 2023 20:09:32 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b001cc3098c9f8sm3225162plh.275.2023.11.12.20.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 20:09:31 -0800 (PST)
Message-ID: <55e640c3-491c-4f55-b432-a41f48405a02@redhat.com>
Date: Mon, 13 Nov 2023 14:09:25 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 14/22] arm64: convert to arch_cpu_is_hotpluggable()
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/7/23 20:30, Russell King (Oracle) wrote:
> Convert arm64 to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   arch/arm64/kernel/setup.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

