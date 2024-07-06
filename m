Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB0F4F1
	for <loongarch@lists.linux.dev>; Sat,  6 Jul 2024 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720235356; cv=none; b=bkIdZeA655MJHj/XBArDq2jzeU5yUu9x61tJXRAJzjC2wktlWYJ1uMmLlie6ZsfTcwQfMRF8fam6ZA0+CbhbvbBxbEgjZdE83iNliBFBSH8bKgIrcJs8e0l4eq7TPF2JFvNmuOtZl6vc5TGhSNv6I2YsR8ocPrOw2yKBDCjmouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720235356; c=relaxed/simple;
	bh=YVBjjprOI2xN33VT5dkz2cNQKrzfiFjoEDt9NETrVek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B14XcCFifhMfNBNVCQzBOTS6gwBVwon12fO3ttWjUWzIidWMUCqLwqM6YZaxqB2g/PriRB5KkORrz5i5dIrt5MpcBUFLEW/LVaPHuYykQYtCmJXpFxG5LO4L1dsNbps8IgU8LPv0BBLRmMODu8p+cmDewadNSJv3NZSKLnGjKKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fa2ea1c443so16319325ad.0
        for <loongarch@lists.linux.dev>; Fri, 05 Jul 2024 20:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720235354; x=1720840154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Njx7jV29iUxIccP/qrNmG9YqstueqET0NeTsZ82ouCI=;
        b=bZOLToYePlRT1KRPkY3GHrP8LFEELdQWSFTr/WnqwM/939JwE16I7MHH91M/FonaJH
         PeOB8A4Hx55fJ9gqca6lvskCjAO8lcTyipKseE9eK7prHrzX3Kx/uj5jopmq7uZP5UwA
         oDrwHa0MXqhv/5wbXQsfdb5TcG/uWH8+fGrSdddY103YO6GgrtXfHjT8xD3YLcl9eLMZ
         E4JGsD8dt4EQ+sMxKM/spkRQeCgWwCq1x1MufpZPSBR2Yj5AcidX0XAhXShpazDDEMFT
         RYsTLMZdZb8gbQ0S4WLDKbzjSvg27N4l6w7NZc+P7CbdRHpTVqw9KZkEwJwz1Iq5XWPN
         8zLw==
X-Forwarded-Encrypted: i=1; AJvYcCX6qPe7+V6bsv6C53m7A20TvKuBDvzsrVxFoAVkYde2zEQiuQT0Se2oFV5x6b4tHIS32n9TCgsN1qmuYyCW/EbOUvS2Rt6b6fLD
X-Gm-Message-State: AOJu0YxKuwPua8C5PUPe/BNTXLvd5gbtAYVmqfTP1/va7R/ww1wxTEny
	gLMqY/D6uqlUbOlzxcArQ1VlsLYsbavS6X9iF7FFbfxT607rE7dr
X-Google-Smtp-Source: AGHT+IGcDp+dFpomnwwA2WkDNbKq6tzzgQoPrEo3M2dS/9iUAaSmF23V3PEf2UXEvF7/E+Q4PVbBFQ==
X-Received: by 2002:a17:902:ce0a:b0:1fb:1b16:eb7b with SMTP id d9443c01a7336-1fb33e0f058mr65953775ad.16.1720235353981;
        Fri, 05 Jul 2024 20:09:13 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb2b1b5b79sm44081715ad.204.2024.07.05.20.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 20:09:13 -0700 (PDT)
Date: Sat, 6 Jul 2024 12:09:12 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>, loongarch@lists.linux.dev,
	linux-pci@vger.kernel.org, Jianmin Lv <lvjianmin@loongson.cn>,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
	Sheng Wu <wusheng@loongson.cn>
Subject: Re: [PATCH] PCI: loongson: Add LS7A MSI enablement quirk
Message-ID: <20240706030912.GB1195499@rocinante>
References: <20240612065315.2048110-1-chenhuacai@loongson.cn>
 <20240706030701.GA1195499@rocinante>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706030701.GA1195499@rocinante>

Hello,

[...]
> [1/1] PCI/DPC: Fix use-after-free on concurrent DPC and hot-removal
>       https://git.kernel.org/pci/pci/c/b69d24a763b

Sorry, this should be:

[1/1] PCI: loongson: Add LS7A MSI enablement quirk
      https://git.kernel.org/pci/pci/c/b69d24a763b

	Krzysztof
