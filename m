Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B613BBC9
	for <loongarch@lists.linux.dev>; Wed, 22 May 2024 07:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716363383; cv=none; b=TZQ7WwfExXdpH6T3nf3s8K6cXsfnXUPgTyZNFwjppg/j1LpX6Nx3DiaDYYG84QR2o0V4vc0g6bnQ8TzB+Bd4ifqTIgStFsV0XDk9mGBBvIpnQInvfQkAfUWFn8MBLBrWKT7zkTzXnfRjQ0RSa/owd+HgAX8syowrUhtw4/yUBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716363383; c=relaxed/simple;
	bh=xJpqtv5wS0sus5aBfOZS2WQnS/pPkC2QI6BMxCDEOHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmAFnhLiWKgaS65Ee5YCCdcOwhNdIceJfoyqqAxYzuyqZz9C9eNT/dxj5OhM919NiHFsr08LATj6rt0pzq4drNviH5bb15g37ajI/wiWgWNxz7TaV8C8K6s2hOUm4DKOu1B6xwW/1GC7Z0v8EvkZeG+lr591DVKxl3UhK9uAL2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYBwz1T2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYBwz1T2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716363380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DpAxOU2aBgMjznsU4cnXhiKkEbSF/tfuwpgPheSiit4=;
	b=KYBwz1T2HynpMnkliTm52UYy0TmO2CjscpVmEdxYy+cidvo1SOJPyP2C6thfg4i30lMl7x
	1UHUr96CEWJhmqJJOAkazI2G6cT+yi1f1RkKK7VxSTTwq/NyxxXn2N7AMvTAFHJVvmGmW+
	JEljN5yHPsgCznP74BLQmD3Mgk0fiAY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-EdCIecKbNZWAKz2dNwR8cQ-1; Wed, 22 May 2024 03:36:17 -0400
X-MC-Unique: EdCIecKbNZWAKz2dNwR8cQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34da03e19beso9359991f8f.1
        for <loongarch@lists.linux.dev>; Wed, 22 May 2024 00:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716363376; x=1716968176;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DpAxOU2aBgMjznsU4cnXhiKkEbSF/tfuwpgPheSiit4=;
        b=W/GXwwa7We+TjzX2uwwtHhF76NJACkw+s805DHBZOiLbPPebaYIEzM/oUXxwxQ1uSE
         pfk6HEpIx/opxhIir6BEFfWYJJiBxfVgbFVDLqHqBf2fjfgHax06xV7n9UM8T2qP72Jy
         tAyuhER8a/oomKT2i/oudtavJQQB3Z0M0XRFGqGNOByhv8Se1/z1fo3s9Uv3+vLciYGv
         KBblgH+9kM51VzTiMsuTKhlvOAbH7UJ2TLICRam7ov6W3H8ttO/as/Uwto6bLaeG3IGm
         83qoIhXEjLrrBARie+JO063+r6DiQuZ5r3K2CzGLLgN0WpDZMsU/NvC4+NIDqFdeLzCa
         PFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPeadRJiKd/IdTli2cfLZo88so6EypTHSXDQkki5RT4etS0571sNNhYWTwgzXs6jHe7d6HS1jAiJxQuveWV+Km6NgenQYgzHz5
X-Gm-Message-State: AOJu0Yz0QEIs4n7e34JpvJQ2UXqUkME9DYff0tuIM9UaLrR/SCMKsevm
	xMZYOsXPzPo+uS9QX3sc0t0Twe0UQ2SrqG3AS0fAFvu3HlXc3vWWfskgkrlJhpXq4KRk6zlv9xw
	ZEyLNUTjE0qXhv6t1nnaJSHV7ARc4mviWj07xRUtHn53RVnfLpZR1rhChmg==
X-Received: by 2002:a5d:4e84:0:b0:354:ed0d:deea with SMTP id ffacd0b85a97d-354ed0de3aemr241034f8f.61.1716363375848;
        Wed, 22 May 2024 00:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIul26mV6vub8/6e1p6F3cWQikk0lGeDfN+8U6+bi2zDxD5zJnDsL8jJG/LlIj0y6kg4Smtg==
X-Received: by 2002:a5d:4e84:0:b0:354:ed0d:deea with SMTP id ffacd0b85a97d-354ed0de3aemr241017f8f.61.1716363375415;
        Wed, 22 May 2024 00:36:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:d500:4044:6d4c:f060:f677? (p200300cbc709d50040446d4cf060f677.dip0.t-ipconnect.de. [2003:cb:c709:d500:4044:6d4c:f060:f677])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbedbsm33553679f8f.92.2024.05.22.00.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 00:36:14 -0700 (PDT)
Message-ID: <1bb2a62c-ba26-40e2-a749-90382ff27595@redhat.com>
Date: Wed, 22 May 2024 09:36:13 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] mm: Add update_mmu_tlb_range()
To: Bang Li <libang.li@antgroup.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 ryan.roberts@arm.com, ioworker0@gmail.com, libang.linux@gmail.com
References: <20240522061204.117421-1-libang.li@antgroup.com>
 <20240522061204.117421-2-libang.li@antgroup.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240522061204.117421-2-libang.li@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.05.24 08:12, Bang Li wrote:
> Added update_mmu_tlb_range(), we can batch update tlb of an
> address range.
> 
> Signed-off-by: Bang Li <libang.li@antgroup.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

