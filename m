Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D881F09AC
	for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753139958; cv=none; b=j91UL09KcHev/REuM09QJTgN5XdIFrK4BEnlfLTPb2O6yp0BlTsoLXWqwxYGCJYPziac3D/3Zo/oIwWZT1GFM/RhIK9rGDj+Q/uSgf/DUYCeBqaxdcltYIeoBBlgZKDkLbw2dmCxxd6FrJcIbPb2OL1UyhSvYsVdFptlsr0/9SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753139958; c=relaxed/simple;
	bh=rdAkJU1uKTabmiWmolO/lfoE99GSpKLoFg6bqNIeYwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4CeYxXoamucQbiw4+Gh9MZqTzuqT9yvoUE3YvwD/cz55B0IpeJzycq1pyYpVUoo0MoEKmez4NpiLWHuNr/uGnMa3N8EpjCucaN86wueEtarKevoecbjHYob3e7fKmab//WoIOG23koX5Bd7ralY2TeIqE4QDXq1KZHkbYFBhSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c51dvkm3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c51dvkm3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0e0e464ecso5163266b.3
        for <loongarch@lists.linux.dev>; Mon, 21 Jul 2025 16:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753139953; x=1753744753; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7uUxr86UctpR4wo5BHRFyvrfjd8nsrpfmZh9G1fUjI=;
        b=c51dvkm3eck85VD6eOhfQBFHXbXmhXDlNn1hMMKDam3zbNsBGs1I+cpaKHjMYIDKZa
         z8UPFzO6/4VKq4SR7dJBmtR6pEYkR1arvJWNWdsIoOjXNJZJyPwEZqQ4JOpFJldGTj2V
         94gpkz9sSykoQGKeyWbtm5n9TGG/FOBctXl4Mb4YAc5otQrrSPnDOvbvEmB5qaqnIm+5
         Dk9o75os0MIOlIs06rhsG99KE3r94UyzBzS36+6KxjySpWc6OHBN1emPx/91bgrXNtHL
         0LTow9eSt1mkgkKp1ddTbUP0Aq0bi5/DVwqkdHuf98YG2hqe+7bxsgoQNymbiYjyzmkO
         u3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753139953; x=1753744753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7uUxr86UctpR4wo5BHRFyvrfjd8nsrpfmZh9G1fUjI=;
        b=HmF1PNub/jk8xjyaDA+WuiEtbySi2oTZWu34Yo8RcbeOGOyqwO33WKm/ShcNZFojSa
         lhm2cTrSeDu3wrK11dMlYjIjMmw/o/Ic+0KMTVTEDkSWwwESXrUDP7SXq8VdstUTAK6D
         DQTsM+R343Eq3VqehtLhBSNaT+SnAJhPxioAHetxrrW7Lz6gsCDoDsN03L+F6jYukoxi
         rXOFng0qMQBA7MgaWlsmPABEvmvr/unPEs5Rn6HkV8EIPQXZyvaYcI104lL3AzobwfTI
         /BuKBvGddZ2ad3b4+WIjWWuSGKRaqDuY1pbBT2L7vypcL4hNTCnLgKUhGqTjI7F+tPuL
         5BJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA1QeTNDyH0Au5vZlSiYEYI5UEQeJAvUGz2Ug8nfC6IMxamiaNDHpdOM9aiLqBMJ4xnvNqfsowpiM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjkB2k2M9Hd9Aq2zrCBKgw+QQbfu2GQvwqSdQCtMmcBL0SRaR3
	GBbKSWybdx6Z18wNX5m/ZVmnflgWEv15lXbbHs6lYgpDKTjTPemkJCx1
X-Gm-Gg: ASbGnct22nQRVBk0+37zznZiTBDDflqIgX/VZztdPhCwEGVnFCniEcP1IrybAvtbrLz
	ntJSwepIHByOxPBYVCgrR3vD8nPqcq/A/viS+mhegfekppwwNsR58jLDKYsjKA2Dad47zQIawFO
	IJFIVI0U5rOJboSeg5PYsNhJuAjlZs4zbX8RjuaJ8AUS76nVtym3qoTlzCqhPL8+Is8F0c+IMrd
	rjEpIysxjIu7ST8CR0ccDTJfMh0PrhZm/xWq33kkeVXmoviOkIbLsAmSgo0e5AeRKOvQmpij1AC
	OrOg5ClQ0RUH3oGtDyM5XJuQmcJbi+Gc9wm6wPPagVXp+/UbJIptinlcct22wRXyANcC0/hrYGt
	K6dyg9JOoIyDkPKBgZS3G9T/7iJoZfv6CfaXyqU57niFT4yAkWZlGEM5EyrLDOgWGgIvf
X-Google-Smtp-Source: AGHT+IEyAyDIGzGDBFvxWK+s5z/H1D9rPFTjwAnBXhww3QxIrjDEOAm8ilmaU8TjGW6AeZa6UNDATw==
X-Received: by 2002:a17:907:706:b0:ad8:8200:ecf7 with SMTP id a640c23a62f3a-ae9c99aa29fmr821747766b.4.1753139953227;
        Mon, 21 Jul 2025 16:19:13 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7ea53sm757005366b.133.2025.07.21.16.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:19:12 -0700 (PDT)
Message-ID: <a1bc7a9d-817d-49cc-b7f1-79a900090136@gmail.com>
Date: Tue, 22 Jul 2025 01:18:52 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN
 option
To: Andrew Morton <akpm@linux-foundation.org>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, glider@google.com, dvyukov@google.com,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-2-snovitoll@gmail.com>
 <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/18/25 12:10 AM, Andrew Morton wrote:
> On Thu, 17 Jul 2025 19:27:21 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.com> wrote:
> 
>> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
>> to defer KASAN initialization until shadow memory is properly set up.
>>
>> Some architectures (like PowerPC with radix MMU) need to set up their
>> shadow memory mappings before KASAN can be safely enabled, while others
>> (like s390, x86, arm) can enable KASAN much earlier or even from the
>> beginning.
>>
>> This option allows us to:
>> 1. Use static keys only where needed (avoiding overhead)
>> 2. Use compile-time constants for arch that don't need runtime checks
>> 3. Maintain optimal performance for both scenarios
>>
>> Architectures that need deferred KASAN should select this option.
>> Architectures that can enable KASAN early will get compile-time
>> optimizations instead of runtime checks.
> 
> Looks nice and appears quite mature.  I'm reluctant to add it to mm.git
> during -rc6, especially given the lack of formal review and ack tags.
> 
> But but but, that's what the mm-new branch is for.  I guess I'll add it
> to get some additional exposure, but whether I'll advance it into
> mm-unstable/linux-next for this cycle is unclear.
> 
> What do you (and others) think?

After looking a bit, it breaks UM and probably LoongArch too.
I'd say it needs more work and not ready even for mm-new.
