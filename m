Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9513957E
	for <loongarch@lists.linux.dev>; Thu,  5 Feb 2026 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302375; cv=none; b=LeG7ZKUFthzZS/r5VhLDhpYXsXwHQFxobIU2OK1l5f2Yo5l2LIu+uSQG/LmdCAhbjaKMEQF7eBAh+xPH3NAzpTluCaB0BnjJq7CxC3FeV8cDtB+H9MPn+A66TItpqVZjOtxlLV+CXllVOMGcRsLBqTWvmEw87g+o2OvfpCutowc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302375; c=relaxed/simple;
	bh=w1d2da4uKDLcEsZloPB5/9/Nvphu7yQHza8wnaEcaic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+r99ZCpVwcuJMRCDb0+2SmGYfcVxT25KS4UpJn2+wz8VEVpzrmzfjNjnM6nEJUS43bjaRpcr/O7qaPQB//HAIBiRHtL121GQ2SXZUae6s3MuCnplwkr/hy43+IQnNRmzGlom5bumHKW58uXWTB4QOa/t5Dkpc/Tlb9IN/cDaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YtJCWMTp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YtJCWMTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770302373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzyhQ6YhgFEds9rDkWc4s/FKttUF9qWsn1wDT2X3GqU=;
	b=YtJCWMTpBLZNmDuqrVYykm/APKfc7FHNx7JUwbJE0MIDyIPNOArWhFuYYplmlLj+OZFUQw
	c6Ldidn1+v+p51XuP43N/K1OyNq952R8PTeCVgYtOEWoZQkIqZX0VukKzglZ8vUDJ0RPIX
	SPYDswZukFSu+5W4yRNMx9PRedHUtr8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-84SWknMiNHK2Q1Xy6gmiPw-1; Thu, 05 Feb 2026 09:39:32 -0500
X-MC-Unique: 84SWknMiNHK2Q1Xy6gmiPw-1
X-Mimecast-MFC-AGG-ID: 84SWknMiNHK2Q1Xy6gmiPw_1770302371
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4325aa61c6bso846305f8f.0
        for <loongarch@lists.linux.dev>; Thu, 05 Feb 2026 06:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770302371; x=1770907171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzyhQ6YhgFEds9rDkWc4s/FKttUF9qWsn1wDT2X3GqU=;
        b=BuQQlx0Gdq+stQW6stepq6+mNNQPzh7qtFCDLx3UfpFuEO+QXoVQqEV9AVC6znFgwK
         v4xC5PKAdXFakFbIaW012Fc4uEdG3iX/j9Rw6YKE6FsBYG8GntE9Xk/kc6HO6ijOYXj8
         9HoRMFagcIBHs0V+PjoXBKM/Oj/CT1HLVjnx0FBTG4D52EFDWRNQJdiKzoHUuGXU83NW
         yUhANR5Q/52nI3TwgBs4jGwdq9F4k1iBFwlnG0ECU/Oqbqq693HMttB/4LEnedXUUAMe
         waArMCf/eU7i8yB5RthGjQQQfRoWaCAJ3+x+tBm4+6TAzIFzA+3gTqI5wNL3dcol4n0F
         JRqw==
X-Forwarded-Encrypted: i=1; AJvYcCWY8nvWUvqrl+iQPssKl5ohTbLsR5yTBQO7u+GwJqY3p/rSDHhczc6rCtJrZ3/ubnHYnoEKPEI1Rvc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhmXYREbsWvLjvK1UV2zUmXrFguchdXLVQcvNP/G/qr45mfoOk
	E4QaKNbPGlSHsHPTdezjQWnSng5kbBakwCr5Guk/u+OhL00zLn1LD40kTyxMgq5I9uaZa5ffHkd
	m5y61B+68lC9UIVPwRe9k6949Fj8QeiGy+yf5V3LNfrCJG39cLhLnTqgtBiaZDQ==
X-Gm-Gg: AZuq6aKSCqRpZXhgRxcZTt2LAI8t5icbBUJSGR7+r3r3kFKvT6RjgNpxAf7+ew7VzBg
	qM3lrdaxhL13ugCULTBXTwYOwUaZv3hIuEd5ATnjYEHBPxrzmh61iRIMFfzkBVLiAgybvS0m5ko
	RW/Qqi8xBfNxFtyZrCVKp3sNW+GJrJfB9vDY48bJM/8H7FsUczFHEn9JF2/AeVt0xFiB7zEnCsD
	1xzhvQAZ2oN8Ya1Phgjm9KQQ6SLZSa6TTfAssXpzgggy5wiMdoTTVkuPKtxRI6ImKBIHgAnOQsI
	pSlv7KjqkrqSzPGuhfGz3dR7x6/YaCs4dY9MEaBmsH2GtLNAqhDnKT0nrnIHUGMvR4I5U8MlkuO
	Gbppp6T3lBkvY
X-Received: by 2002:a05:6000:2905:b0:435:faa5:c14f with SMTP id ffacd0b85a97d-4361805c3ccmr10614490f8f.44.1770302371207;
        Thu, 05 Feb 2026 06:39:31 -0800 (PST)
X-Received: by 2002:a05:6000:2905:b0:435:faa5:c14f with SMTP id ffacd0b85a97d-4361805c3ccmr10614436f8f.44.1770302370763;
        Thu, 05 Feb 2026 06:39:30 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805813asm14040331f8f.27.2026.02.05.06.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 06:39:30 -0800 (PST)
Message-ID: <d4329f05-b9c1-46ef-b2fe-a078f9618892@redhat.com>
Date: Thu, 5 Feb 2026 15:39:28 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 net-next] net: stmmac: dwmac-loongson: Set clk_csr_i to
 100-150MHz
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <20260203062901.2158236-1-chenhuacai@loongson.cn>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260203062901.2158236-1-chenhuacai@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UZ6tlaPK7nYiGhv7Fuu69i-4Xf2hw76vtkGrdh6YmPs_1770302371
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/26 7:29 AM, Huacai Chen wrote:
> Current clk_csr_i setting of Loongson STMMAC (including LS7A1000/2000
> and LS2K1000/2000/3000) are copy & paste from other drivers. In fact,
> Loongson STMMAC use 125MHz clocks and need 62 freq division to within
> 2.5MHz, meeting most PHY MDC requirement. So fix by setting clk_csr_i
> to 100-150MHz, otherwise some PHYs may link fail.
> 
> Cc: stable@vger.kernel.org
> Fixes: 30bba69d7db40e7 ("stmmac: pci: Add dwmac support for Loongson")
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

This should go via the 'net' tree right?

/P

