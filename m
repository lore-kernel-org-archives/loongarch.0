Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22D14E2FE
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 18:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945138; cv=none; b=nZMIBUt4//wt2Pdy7ukNz9sMSutxsVuWWQESuuWNHb0kN16qr9fCBcmfNkLRJ8VsUxS23ofzobCY/iXAhuPKinL8jAWHx3/XhhdUHOL0he+WVOkoWcvqSZqmwTXl+/NdWBsYX92qIqMdV3a+8jGuSxQqvrNwko9+aI8N5zNepNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945138; c=relaxed/simple;
	bh=/F4Q9+7tbP9ySS1ScciWSXO7ebXpuvtEIyWrRaLQfS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2yhzEjdv1RvVqahVrzEuMXfhNnxLMBduNydNlyV4QmMq9Spi/r0qXnCWT4AgYtfmYxAzOZYBXiImVrdZY1suFlAItKVrB6DjtTVBUmuuBR0+y95OWMn/uzu3iQ/1wOkP7LHhFsEYgKFg1TZes5u0iHAQGwW5/LpucYdoQSCse0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gklLjh1A; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gklLjh1A"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e51398cc4eso11726825ad.2
        for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712945136; x=1713549936; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49adEIqrpP0J1XcwnyVGewM/PJvauGE++ZVC/WjnIFs=;
        b=gklLjh1AVn4BuYyDJt5naFbdKXdHOdn1KePi5XGlV/I7fg5aoW/lLAVsjTYfssgNGl
         OhBXBvUaZ/5tpkdjDgWALQV97jwIuRfaxFsaZCXhWdkGNfsHOFOmYo5AzRhCA9Rj53ao
         oJ1LK54NWgk2mO1c1h1+rJu2X/Hk3eNaKuAE23c1fx8c8psdD4o1M0PflK5H2QKKAGrB
         WjubVTMRcTUpLca7Qm2Rcfb8fQr+FZNhqLMmQgAqrTbuCnYbkeefGwlm+wSwhwacdps1
         H5rlogs3xLNDHCHws64UbJmC10/I/7LPnrPUFeelu1a9SKX5VUmQvMvLg4tLftjNzvUd
         szbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712945136; x=1713549936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49adEIqrpP0J1XcwnyVGewM/PJvauGE++ZVC/WjnIFs=;
        b=dEzwx5XxBXb6WLvxdrj8q90SfDuz7MK8q6dOCjKozHhPEEYjnPspXcx4I5jgAvB0pA
         wVhk7nBrr0HRAeRDSy35Ft5DlrqdIXrf8foID3Pku2MuZyCnezZksx0cMter3lxGV5rS
         EsJ6ZRWvgIJRlXB1NPomI0j9AolDblvl3DVNt+/6ynkQPHohSSJD+pzlncQKcVZGvZ+4
         vnTy1x0LKzTCOufCxEivCj4jVuGIJ55gDunotFFjQcpKDm3a7A1bOPMFtIgI0XR3xGHk
         r5wk9bJWVOgGERflNew49zC01lr/rehJCV9Mk/ZrIVHlJgti++Fs59kIordBXzRN2UYm
         N8NA==
X-Forwarded-Encrypted: i=1; AJvYcCUcgtSH4NzXzHRapbccYp8Yq1dQidZKUJAAQKYoxQA4CWF+y3u8rU6uK6/wqnGt9JLQTPkoT2NhUybzHcCO2S74G/jLvA9dL0cT
X-Gm-Message-State: AOJu0YxbTx7CUZgqwRK+uO7/ClkRgLCcnGBYczLzjekw600lPiZ0gd4i
	0YqrtWQcOxoxYg+PMLu+EoWHQpcLC+Sg0N67Lc1IwTmWs88ieHqJ
X-Google-Smtp-Source: AGHT+IHYepwYRiV7O2n571JUT01a7WtvHGmQaaatE8xYsUy/fnmFllAFfc3bbHk4zZ1c/m5U+E2KjQ==
X-Received: by 2002:a17:902:930c:b0:1e0:2977:9dfc with SMTP id bc12-20020a170902930c00b001e029779dfcmr3236218plb.55.1712945136393;
        Fri, 12 Apr 2024 11:05:36 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:a5f4])
        by smtp.gmail.com with ESMTPSA id f5-20020a17090274c500b001e0e8e4f7e3sm3256013plt.206.2024.04.12.11.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:05:35 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 12 Apr 2024 08:05:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, chenhuacai@kernel.org, josef@toxicpanda.com,
	jhs@mojatatu.com, svenjoac@gmx.de, raven@themaw.net,
	pctammela@mojatatu.com, yukuai3@huawei.com, qde@naccy.de,
	zhaotianrui@loongson.cn, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	cgroups@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v2 5/6] blk-throttle: support to destroy throtl_data
 when blk-throttle is disabled
Message-ID: <Zhl37slglnnTSMO7@slm.duckdns.org>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <20240406080059.2248314-6-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406080059.2248314-6-yukuai1@huaweicloud.com>

Hello,

On Sat, Apr 06, 2024 at 04:00:58PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Currently once blk-throttle is enabled, it can't be destroyed until disk
> removal, even it's disabled.
> 
> Also prepare to support building it as kernel module.

The benefit of doing this whenever the ruleset becomes empty seems marginal.
This isn't necessary to allow unloading blk-throttle and
blkg_conf_exit_blkg() is also necessary because of this, right?

Thanks.

-- 
tejun
