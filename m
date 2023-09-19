Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E320F1
	for <loongarch@lists.linux.dev>; Tue, 19 Sep 2023 03:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695095647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=opGMZb4zVfpw4j3bwF+zyk+VH4LC+VDK5rPEHS4VpxU=;
	b=izEHEpmnn7a0TpROM4XLYPJ0B984kOdJq/2W15A+l1aQrPYrNDzvX+rJekFNuOn8m+nFnM
	CvO/li9oaeGlUNKcsyUWO+YjZRrJ6PVqk5O00NThV8VUcpQNv2NSf5Louct+0b7jlxjhy+
	qeazz8Zyr0DLnRm0yJQCs4QzKt9TxgI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-RL6K-rOlPnmTnDu8BaVDfw-1; Mon, 18 Sep 2023 23:54:04 -0400
X-MC-Unique: RL6K-rOlPnmTnDu8BaVDfw-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3ab724f59deso8853842b6e.1
        for <loongarch@lists.linux.dev>; Mon, 18 Sep 2023 20:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095644; x=1695700444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opGMZb4zVfpw4j3bwF+zyk+VH4LC+VDK5rPEHS4VpxU=;
        b=kLN0dEh4Ah/dvsQVa8gvN3vEgMVHrkWFCfPS0miiaX68qFra+zos1P/7cHRCXvLzoM
         1sWzWYU7JP5Pv6R5Ugn7vGMXZP8Vw/CWQj/WJwlalVPkur2Ag0xPFIqH//YHhdchUyIZ
         GmpFEGUFhaw8jr3+7CHgGM5wguz4PQyc0nldRhVKiGCdKu2lvQmo89xe1aEtVYkOiMa3
         bStEDo8YFnHTiwUK8H27UIaYMXE0DDJhVMSJF+X0FuVDhnf6IFa0XhKS9KJLcMQ6Tkys
         3iysml4qaEWN06GA0svw8heuh9FmZTC3y8bQQ+6w+6gf9weUoUMNs2yydYx86EFf2TQO
         d/lw==
X-Gm-Message-State: AOJu0YxTzxQkK7qPmxYhrGt45JW4wKGhyoBFhdi9yAmM97QxQDeQOnpX
	jmsKA7MCVYLkNzrI5m9i69k5jg7I1alIfx7fgBLDkxdSjmLtU0a/6GgntV24PFBJxurp/PCQmOO
	GwFK8MQf6PJx+UOaL/sQA
X-Received: by 2002:a54:4504:0:b0:3a3:76c6:a46f with SMTP id l4-20020a544504000000b003a376c6a46fmr12922332oil.38.1695095644171;
        Mon, 18 Sep 2023 20:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGYlj7TJDnGHj/RWXEc2C+lTOzyiwCCuIn5mHVU8DsjC6vooAlJ9Xs3Gr3phqs2j6qI73HUw==
X-Received: by 2002:a54:4504:0:b0:3a3:76c6:a46f with SMTP id l4-20020a544504000000b003a376c6a46fmr12922314oil.38.1695095643929;
        Mon, 18 Sep 2023 20:54:03 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id s5-20020a17090a948500b0026b3f76a063sm7639370pjo.44.2023.09.18.20.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 20:54:03 -0700 (PDT)
Message-ID: <ea0a43be-4143-7efa-b1c6-550ece6965f6@redhat.com>
Date: Tue, 19 Sep 2023 13:53:56 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 30/35] irqchip/gic-v3: Add support for ACPI's
 disabled but 'online capable' CPUs
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-31-james.morse@arm.com>
 <ZQLADHCbOr5J8TpX@shell.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ZQLADHCbOr5J8TpX@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/14/23 18:10, Russell King (Oracle) wrote:
> On Wed, Sep 13, 2023 at 04:38:18PM +0000, James Morse wrote:
>>   static inline bool acpi_gicc_is_usable(struct acpi_madt_generic_interrupt *gicc)
>>   {
>> -	return (gicc->flags & ACPI_MADT_ENABLED);
>> +	return ((gicc->flags & ACPI_MADT_ENABLED ||
>> +		 gicc->flags & ACPI_MADT_GICC_CPU_CAPABLE));
> 
> ... and this starts getting silly with the number of parens.
> 
> 	return gicc->flags & ACPI_MADT_ENABLED ||
> 	       gicc->flags & ACPI_MADT_GICC_CPU_CAPABLE;
> 
> is entirely sufficient. Also:
> 
> 	return gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_CPU_CAPABLE);
> 
> also works.
> 

vote for the second one, which is: gicc->flags & (ACPI_MADT_ENABLED | ACPI_MADT_GICC_CPU_CAPABLE)

Thanks,
Gavin

