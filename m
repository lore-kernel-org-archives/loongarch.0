Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE63716F274
	for <loongarch@lists.linux.dev>; Thu,  9 May 2024 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715269518; cv=none; b=ouzDNKctFiKwPLkqK0x1czannWzVrTFGvdYBjkwBReEto7gf01sjUPADgxttDv6VpM6ItF/Oxax4R5j7+owVVH02InFMrvp6sS3rHiB2u1xcE+96tgK7lZWb/ka/Hw2ljiBYf5AwZGfdO4zGmv2Bu6ViOUgpiz0oOBuSv3pB0AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715269518; c=relaxed/simple;
	bh=DZNYdSr3PQT2Ytv6yKADnFDz0/6OYvMONIsLOfnnwGs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OhzQk4Q9ivqImV7nXamTIvL+7MXNnIyJUHK5Ft4cuKx34BWpnOxqQtdMvMHlwY5rKFrF17Y6rgpZXEOFLE+Yjb7Sj/Qud5YQhdZS04D5tWBjuVKUOHtWLdbtHtb1rYKWvFCCPBaDKhm56zFN8/ThonKclNl0JFpdD/BEeHrj3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=bhC8aeqj; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="bhC8aeqj"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7e1b520812fso307639f.1
        for <loongarch@lists.linux.dev>; Thu, 09 May 2024 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1715269516; x=1715874316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gUCh8FY7gsl2h4E/kN2GFyVm9t1B96kSbiEPvae8u0=;
        b=bhC8aeqjgGcaEN6ZCSQEWlmj1K5k3e/lcpW7ccJ+O98d/1Fsl0L2tcp4S4VZNb7Z2R
         1kmsvLPvZbWi4bprh0h4ERQBqVahFmuYZuK8eL102x/YgnK8dYkOL0Qo4TT4ap+2DSiR
         9x0hS74XWPfJcwU6YAPpEVtX/3r7N/yaKMbABvizsV/AMSEe0EDcF4dDl0cNjAuOcVlM
         FaHf58f4qvbQzVzL9H215uATr0kY613mS1cYakIjsEyT0FtNiQIXrU81NlAHCoU4g4Co
         WmBY1zKBGDxwI/ARgObh1BNuUSgxXaDI5NuHuiJNeaUxOjxHTPlEpaaCgADHyNyaZuJI
         roiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715269516; x=1715874316;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gUCh8FY7gsl2h4E/kN2GFyVm9t1B96kSbiEPvae8u0=;
        b=iIQATZw9RkqLo8q7KvWShgtnFovTePPtdKZ0D9r9gNkxRDzFatX0gzcAl/PWiykG+N
         qv4lRzq3MejEyZ/OenlxwG9mLSMR76LsVld2P7sfEfYISdk4T2FR77E7UmWD8et/MWeb
         eweD6YwGiGYeE0n2u6wApztmPTcouiwxrY77s0vYhV3VlroBGvMWtz1lYSwVqdO6zORn
         lcOSFkOzz0Qr0b0s8qaUQh2759zP2XJ4znNfB6GP+pxEt+1XUzo9uqgGso8FhefXrjIp
         LujXEgr393Bk/p9JQnxEQOh3nn+yDMP7m6s1YUyuIz7hWeFr7RqRwOkxSghrWrcLzzNu
         ww0A==
X-Forwarded-Encrypted: i=1; AJvYcCXU5y0HoyeMkOr9NaI23qtFXpYvJVRjmSK34ZSwv6BPEi1Gs571XPNMLiNMdzRbLFqabJ4GIAzNwj0NFDC4waiVWbF+EoAhfnPx
X-Gm-Message-State: AOJu0YxyTkbYwIefICYbLBSwLM9K2W23M5G8NENVC98R/ZMN4ejcrjeK
	sZo/jf+7qjJP6TnMh3fVDLM4ImjXLSILU7mui2WZQLiNBbhfdrJZEunNXa2g60YJPk2j1eQBrHC
	H
X-Google-Smtp-Source: AGHT+IEonISz5k6S+QhuL+vpC60UupW6zWwKsP/6j7LitGl0JXGDRiQ702VSRrcsV4zjn3bncreQ3Q==
X-Received: by 2002:a6b:d101:0:b0:7e1:86e1:cd46 with SMTP id ca18e2360f4ac-7e1b520b2f8mr8525739f.2.1715269514443;
        Thu, 09 May 2024 08:45:14 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-489376de473sm416106173.154.2024.05.09.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 08:45:13 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: chenhuacai@kernel.org, tj@kernel.org, josef@toxicpanda.com, 
 victor@mojatatu.com, raven@themaw.net, yukuai3@huawei.com, 
 twoerner@gmail.com, zhaotianrui@loongson.cn, svenjoac@gmx.de, 
 jhs@mojatatu.com, Yu Kuai <yukuai1@huaweicloud.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, cgroups@vger.kernel.org, yi.zhang@huawei.com, 
 yangerkun@huawei.com
In-Reply-To: <20240509121107.3195568-1-yukuai1@huaweicloud.com>
References: <20240509121107.3195568-1-yukuai1@huaweicloud.com>
Subject: Re: [PATCH for-6.10/block 0/2] blk-throtl: delete throtl low and
 lay initialization
Message-Id: <171526951316.85538.15766009475504777468.b4-ty@kernel.dk>
Date: Thu, 09 May 2024 09:45:13 -0600
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Thu, 09 May 2024 20:11:05 +0800, Yu Kuai wrote:
> Tested with the new blktests:
> 
> https://lore.kernel.org/all/20240420084505.3624763-1-yukuai1@huaweicloud.com/
> 
> Changes from RFC:
>  - remove patches to support build blk-throtl as module;
>  - add ack tag for patch 1, also rebase on the top of for-6.10/block;
>  - some small changes for patch 2;
> 
> [...]

Applied, thanks!

[1/2] blk-throttle: remove CONFIG_BLK_DEV_THROTTLING_LOW
      commit: bf20ab538c81bb32edab86f503fc0c55d8243bbc
[2/2] blk-throttle: delay initialization until configuration
      commit: a3166c51702bb00b8f8b84022090cbab8f37be1a

Best regards,
-- 
Jens Axboe



