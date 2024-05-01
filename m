Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8034A48CE0
	for <loongarch@lists.linux.dev>; Wed,  1 May 2024 11:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714561871; cv=none; b=Z5ZD16lBYV2zv3RUPF50Kvf066hZvUPQq/6ntGZ5if/gpG6Zc3vtmy2lNqMGqQZd0m+/St0ITT1lf0iBsC0IFCj5lxL+QAYWIMSsd4YC9PrJtkA7UtehBiMNV91SJc65/iMdibKOzNyIrMlK2AdyVowqJFFy6YFNjDB4bPvVuHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714561871; c=relaxed/simple;
	bh=HjmQN/vLfXCeKes7nGzRxBen9HgLMO+9+ng5Ze3Bavk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYUko8waaf1Vmt4SOHMdKVb9J08sea8IkDZXTLFRHjiTK2alBudtspbGtAamSrFAaMKr/lShMVkVroC0WA0pC5ebyRl5dnAI9m0hMCj7GYqi3WkRdZkoWuj/kFBAyXdq1pzNUnYX9T48trKPo0wTx5Zi33W/iyv/3tI4/MbB0wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AdwJeK55; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AdwJeK55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714561867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9EhiTpZ039qYHHJ6iv2nIzs+2XcBDCLGyTfEI94qWw=;
	b=AdwJeK55hxoBcMTRfNAs9Aob7W+ZGgvJsyf9DMHJOeCknTdUZnQ9eWYMfz2rnsstS0wKS+
	2ItzrNhOPa8CuZcm+8xKQmQLYJqDeeN+jTq3Q7hZlxifuKRFd7kERReFt6axqpZUiWI/Xu
	qC3fAcw28EI1I2/J5HfFiCBIpxneewE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-JzPYzTbfO4yBiUkDzm9mag-1; Wed, 01 May 2024 07:11:06 -0400
X-MC-Unique: JzPYzTbfO4yBiUkDzm9mag-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-60f1bd44f4aso4692826a12.2
        for <loongarch@lists.linux.dev>; Wed, 01 May 2024 04:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714561865; x=1715166665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9EhiTpZ039qYHHJ6iv2nIzs+2XcBDCLGyTfEI94qWw=;
        b=rI6wMRjephMMijJ7MmhVp01P6bDCmZW4ZBF6qL9pT5DSLmBQvQf2+bMYdxaKo/QAV/
         z4j0OIw8uq3Y9c5m1c/b4O5GrXPgNXwQ2ijh4JANWkG9UrsHAv0nVC8rhPGtBLhkC/Gi
         3xrrxZPEzvsr0cJwAErtMWbLXe29HfCqSZI1U9pfrSYoo3u/MAJU7Uv90a10U6QV+xaV
         1xG1krQJBosuK/QTg4e4O5caTCqIFij2gprr5D7/5iSNfQ4dQuHdE8/lUuqPNVF2FJLy
         EsEo02UvaE1EuhqqgEH+U20/qQsAlO6l6sKbeZzBH6BDFRhtyiH7/8vZhU9jRJDQJyAT
         JU9A==
X-Forwarded-Encrypted: i=1; AJvYcCWOo3DqTG/26Eag0LiJ5G11N1gYFBNakQ2Z90668Eh1kXnxlUL1XnnvniU6sgNoY5Zyg9aDK6I1KwdoKLQYsWcSTaQtcEU0Ed3I
X-Gm-Message-State: AOJu0YwnVPI7NYA9tFEXTaXx7O+y2gnn6QmrVjuMtivBh/YryHtnVhf6
	OaOgWimRA1l9Yxkrbnsx/t0235v/1xR1MZPh2rKCYiBYTcSfYInQhGL1ZRW8WXrc/IN/Pfnptn5
	jcj4rP4y0AXujVqaGYBsAa6oCRUIllYCAutTS45lbQbku0Q7hZhqRGS6inA==
X-Received: by 2002:a05:6a20:f38a:b0:1af:59b9:e3ed with SMTP id qr10-20020a056a20f38a00b001af59b9e3edmr2412152pzb.5.1714561865244;
        Wed, 01 May 2024 04:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjAPRGKaaujq7rTK1yaA7Ot9xIJqN3jHlI3pLra3C5HiqJNFkOQs4ByCYnk6CyZCfgy9Hx2w==
X-Received: by 2002:a05:6a20:f38a:b0:1af:59b9:e3ed with SMTP id qr10-20020a056a20f38a00b001af59b9e3edmr2412126pzb.5.1714561864872;
        Wed, 01 May 2024 04:11:04 -0700 (PDT)
Received: from [192.168.68.50] ([43.252.112.88])
        by smtp.gmail.com with ESMTPSA id r10-20020a6560ca000000b005fd74e632f0sm15597042pgv.38.2024.05.01.04.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 04:11:04 -0700 (PDT)
Message-ID: <47e1b241-9085-44e6-a3d0-4ded94a183ce@redhat.com>
Date: Wed, 1 May 2024 21:10:53 +1000
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/19] arm64: acpi: Harden get_cpu_for_acpi_id()
 against missing CPU entry
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
 justin.he@arm.com, jianyong.wu@arm.com
References: <20240430142434.10471-1-Jonathan.Cameron@huawei.com>
 <20240430142434.10471-13-Jonathan.Cameron@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240430142434.10471-13-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/24 00:24, Jonathan Cameron wrote:
> In a review discussion of the changes to support vCPU hotplug where
> a check was added on the GICC being enabled if was was online, it was
                                                  ^^^^^^^

                                                  typo

> noted that there is need to map back to the cpu and use that to index
> into a cpumask. As such, a valid ID is needed.
> 
> If an MPIDR check fails in acpi_map_gic_cpu_interface() it is possible
> for the entry in cpu_madt_gicc[cpu] == NULL.  This function would
> then cause a NULL pointer dereference.   Whilst a path to trigger
> this has not been established, harden this caller against the
> possibility.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v9: New patch in response to a question from Marc Zyngier.
>      Taking the easy way out - harden against a possible condition rather
>      than establishing it never happens!
> ---
>   arch/arm64/include/asm/acpi.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

With the typo corrected:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
> index bc9a6656fc0c..a407f9cd549e 100644
> --- a/arch/arm64/include/asm/acpi.h
> +++ b/arch/arm64/include/asm/acpi.h
> @@ -124,7 +124,8 @@ static inline int get_cpu_for_acpi_id(u32 uid)
>   	int cpu;
>   
>   	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> -		if (uid == get_acpi_id_for_cpu(cpu))
> +		if (acpi_cpu_get_madt_gicc(cpu) &&
> +		    uid == get_acpi_id_for_cpu(cpu))
>   			return cpu;
>   
>   	return -EINVAL;

