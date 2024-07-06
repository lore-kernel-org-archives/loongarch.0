Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DBB28FC
	for <loongarch@lists.linux.dev>; Sat,  6 Jul 2024 03:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720235226; cv=none; b=rKXcSaC/vrU/PpUSqltS0dPffWdxhURy4l5lTnq6Xc0bkTN8i+sDe+EulyxOHHy5LVE+8w8UpSxIledYb4KFP9U8mHqPxiKFfleFvgWxV8urB9pt1dgXlu8b1aCdHJL8iueQY4LjfyxiVX+h5KvxGqZd7wo1oZ5Iin0JtSV6paE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720235226; c=relaxed/simple;
	bh=ngljVW3PZb17rkn34LUMdX1JI38Q0k/D5pbIVGM8tmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRnq1zlq0MWML5895OulwD6P9ymgvduY00VbACxl8T5YDn1+hwDtZnZHRK3YNeOee3tgfufehAC553NNvot9fNw+uBegLqfPQ3YWFzvWN1zWf5gOLGiU1xqxYcStKjcTbH5f7Hy+h2L+qnlNd8hm7JDc1RNgWovHSiohRtNgzmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3cabac56b38so1382181b6e.3
        for <loongarch@lists.linux.dev>; Fri, 05 Jul 2024 20:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720235224; x=1720840024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPdvg1XTUtnEGz1joPO5mZy0DEvXNcNHwnijHftKF48=;
        b=rWeAoPvjLf0bXoQbi/iyBY2bVyLeTyCzS9KOk3oRYgEBQ8xfJ+BCU93ppXcB4U4+KK
         FrIFtuNRPBvXiLHvDg7ygrONSu0j/nZ02sGnbNX+3RUgnNtmxEtKQ+iMD+sRaKsBZFDv
         bg2APkOuSWmbrmVCnbe0JjQSdVbY82iX/cldMnkBQLt2uTNnNoLsOTOxNPNmWMu3WNJe
         vVGGOzn85kqiIRqJwHCGxxXHf9AYSae9QZnm81s3bdFvHlDc83vaslpkgtW0PrXv3g97
         8pqfqDEP9LAwsiDIL8ipLuDeq5Nu7dYib3IgXmFhw16VV+OZZCKqfYXNzve74wqpJUsa
         QCEg==
X-Forwarded-Encrypted: i=1; AJvYcCUosA+yLHLsaQakEJJe6J1KfgolrYeOcTxPkK3G1znnkid0XSBz/miugSv2CeO0JNZkd6W9G5ddbtggGiiHUuLzK6oKIs8HmWdv
X-Gm-Message-State: AOJu0Yx+NCWQYCKpZYjYu2+oyZZd5FtE+Lwk+UgWUkcxMm9VlkEifzT9
	DPbbvnd6SUPco5UqHGN9NvhmOTfiBn6COOMIpFtRk8A0kTEgWoji
X-Google-Smtp-Source: AGHT+IEDHTTBvjqLHAnJK5kvDoslHvFnypo1j9DNPnLqdBleoHtHQ6L7gk1zAWVnVJXv7J6BQfgFwA==
X-Received: by 2002:a05:6808:2227:b0:3d9:20c3:cdab with SMTP id 5614622812f47-3d920c3d1b1mr2138629b6e.16.1720235224093;
        Fri, 05 Jul 2024 20:07:04 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080256c9dcsm14715249b3a.74.2024.07.05.20.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 20:07:03 -0700 (PDT)
Date: Sat, 6 Jul 2024 12:07:01 +0900
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
Message-ID: <20240706030701.GA1195499@rocinante>
References: <20240612065315.2048110-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612065315.2048110-1-chenhuacai@loongson.cn>

Hello,

> LS7A chipset can be used as a downstream bridge which connected to a
> high-level host bridge. In this case DEV_LS7A_PCIE_PORT5 is used as the
> upward port. We should always enable MSI caps of this port, otherwise
> downstream devices cannot use MSI.

Applied to controller/loongson, thank you!

[1/1] PCI/DPC: Fix use-after-free on concurrent DPC and hot-removal
      https://git.kernel.org/pci/pci/c/b69d24a763b

	Krzysztof
