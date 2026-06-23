Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C6F36E498
	for <loongarch@lists.linux.dev>; Tue, 23 Jun 2026 10:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209446; cv=none; b=CgNYr+Jx4tZG8jO/QSSqkrXesq5W7va9RzU0/Jg+ld37YoOHQ1zAAm2NkHDTi8+6VymDPGa9vEmThLT0+W6zz6NC2hDssuCxYC9amqH9eXyCuhXWtVbpnZmng+5o0sOW4samXcJflL8bShrdw2xdh56SbJGoC+dR6cOVIlUAGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209446; c=relaxed/simple;
	bh=uhA+JyyRZIPxz0qljYM0uVmm3ahqPcFCCZcwfbgkmhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3wzG84FdMQM6cm0NmyRa3uEX8jYpAB/LAyenkrDM1rovDDzwbhN+sFt6VYlix7W6Zo5gUoG62Ki6WGDLKWxmWeTQd0TsD9Lcvzx4FUibfl4oVv93jTXAcAguIPKabMmjBPDoL7y2REt4x+eDPm06MSFyeXOLYn61+D3EzYkhB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmcadRt/; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmcadRt/"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-37cbcf49deaso2673690a91.1
        for <loongarch@lists.linux.dev>; Tue, 23 Jun 2026 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782209444; x=1782814244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9xRyN5mmtNm+QB3YIDVLwBheiPW9GTxijNSPRoIWhA=;
        b=jmcadRt/94lI4t/bfHXWl7FbDBxwVCQdz1fZiQYU+rqadkxEx8+R/eB6cVZF10RQUh
         ltZfYwIK/kYz5yTh9e/ojhmb0nr6YPsCh2zCt9YsKsXOWAWNCt3AutrBbau3TpW15HNg
         WKOrv/Kqs9hlPIOwnd+lMMD+D4zZl+71z3ORQancrD933gdglej5wuY1BpHN7NuFoaV5
         phrjatrMIjaDSXd6NeqSIzHlRxYjKjHN6Reo8d8hVodDbSq/cTsoQrd1/p0MEWO66aAm
         53ajD9USUf0iVbRI9KJPOGPXX/uE89d2mJK32aqBXakWDtCipYhBWTdYqYNyns0ScbbZ
         Wl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209444; x=1782814244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9xRyN5mmtNm+QB3YIDVLwBheiPW9GTxijNSPRoIWhA=;
        b=sI9mC7ENs9y8QPMUrs4jHUIEoBgwph81Rxnu++Pplf6T4m4GongaBwW1s/x0zHJJyc
         uiMpS2uRKUQ+ry1UkHk4jDIKmkbxWd1zHYau+ZOS7rZ/u3CkYVWUGxN0d/+Oqt/ZLe2z
         LuG1t7kj7EzOCvFwtPAtMEVsJreExE+znyIhYF4/LJcgoOuqN4uQfqFBRmworCBYSDnA
         CuLXq7SvYTbK+zukZUeolPth4I0CZz1jni4fNHU32n+RM51tLRg5tvlixGff3vGTkxbF
         08aTB9AHyWgqfK3n+VegfHpn9N0OWA7nFDl0sDnwu9ywTsEORTkl6/AcJqCSZ3SgSD2d
         EJ/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpS57hliRPnV1U/+dMIFjYaFcIQc4H+G0X6z1VIaFF+THxmTV+b7NiRTiGnqxUsC7i+kbrGhO/iRFY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJgk6wfjQMTbDyOP98Myl5p5vTCmAOdvcGRVKSBd/TP/3/OTRP
	bJPbfCn1d7qZ5jr7ffBiR1BlGJf0N+ZE09Uw+rZ17KnfTQhoyzYFxioe
X-Gm-Gg: AfdE7cmbcoF/Hiw3cIGYMSdK7fCsTKMsWdns76kxqyvNqtYITxCGcqKWKHmzScdBeLk
	L5gHs3njpDpirKwj5SN2cHBmmU0IwpR/7nthHF2+TT8TQ/2bknq/VzKosBtqWY8rrk1JYwTaYiX
	ybpwhnZV1i/gr5pkkBrxpitx21F9janhfgyqTWPAPiEkCIirelbxiN1crZhjFw/wrL6CpI3dptP
	XdBXyBdWU/zj4zdlrKsncq0/8Zqrh0nubgrzsKCKIaV+ohCWxRf+9vhIEduz0T2ggO+x0QciALI
	Q8uFzi3/I3DY3fLLXvsdbO7lTdGN32QEDCZoJbHBgvYTHIkzmzulK5P5PccS1695Rz0edE0ByZa
	wUQp4rLDeZDmFy9XHLukqm0NvDHzHXzchkCncDhfj+9CRzL64Snc5gGG0bmRTCvfkcsZwW1/YFU
	bM5waP94LbRsmFhZ7Rhhg2IkYwXcaUcof7rg7zFM5p
X-Received: by 2002:a17:902:ec8f:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c7c99def24mr17988445ad.20.1782209444473;
        Tue, 23 Jun 2026 03:10:44 -0700 (PDT)
Received: from zhr-ThinkStation-K.mioffice.cn ([2408:8607:1b00:8:ede9:3e72:37cf:55a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f7e0asm118059125ad.30.2026.06.23.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:10:44 -0700 (PDT)
From: Hongru Zhang <zhanghongru06@gmail.com>
X-Google-Original-From: Hongru Zhang <zhanghongru@xiaomi.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	bhe@redhat.com,
	chentao@kylinos.cn,
	chrisl@kernel.org,
	jack@suse.cz,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	liyangouwen1@oppo.com,
	ljs@kernel.org,
	loongarch@lists.linux.dev,
	mhocko@suse.com,
	nphamcs@gmail.com,
	nzzhao@126.com,
	pfalcato@suse.de,
	rppt@kernel.org,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	vbabka@kernel.org,
	wanglian@kylinos.cn,
	willy@infradead.org,
	youngjun.park@lge.com,
	zhanghongru06@gmail.com
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page fault performance
Date: Tue, 23 Jun 2026 18:10:09 +0800
Message-ID: <20260623101009.522775-1-zhanghongru@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d04f745d-eb3e-4d2c-8ea2-5fdcf2cf27b8@kernel.org>
References: <d04f745d-eb3e-4d2c-8ea2-5fdcf2cf27b8@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/23/26 10:02, David Hildenbrand wrote:=0D
> I know that especially browser usually use fork servers: a tiny=0D
> (single-threaded) process just to create new child processes. Any informa=
tion=0D
> regarding the apps above that use fork() on small vs. large processes?=0D
=0D
I wrote a second BPF tool (fork_info) that captures nr_threads and=0D
map_count (VMA count) from the calling process at the exact moment=0D
fork() is triggered. Results from 3 representative apps:=0D
=0D
  App (category)          Fork caller        Threads   VMAs=0D
  -----------------------------------------------------------=0D
  Taobao (shopping)       DaemonThread-6        526    8,987=0D
  Amap (navigation)       DaemonThread-6        289    7,120=0D
  UC Browser (browser)    OneNativeThread       350    8,144=0D
=0D
These are all heavyweight multi-threaded processes (hundreds of threads,=0D
7,000-9,000 VMAs), not fork servers.=0D
=0D
> Above you write "some call fork() from multiple threads". Any further=0D
> information on that?=0D
=0D
Xiaohongshu (com.xingin.xhs, social media) is a clear example. In just=0D
tens of seconds of normal usage, fork() was called 22 times from 4=0D
different threads:=0D
=0D
  PID     COMM            THREADS    VMAS=0D
  4206    com.xingin.xhs       85    4,140=0D
  4216    Thread-2208          85    4,157=0D
  4208    Thread-2208          90    4,211=0D
  5200    Thread-3200         337    6,519=0D
  5200    Thread-3200         343    6,563=0D
  5200    Thread-3200         361    6,769=0D
  5200    Thread-3200         453    7,793=0D
  5200    Thread-3200         450    7,779=0D
  5202    Thread-2219         459    7,846=0D
  5202    Thread-2219         462    7,875=0D
  5202    Thread-2219         465    7,899=0D
  4219    Thread-2219         465    7,903=0D
  4219    Thread-2219         468    7,922=0D
  5202    Thread-2219         467    7,917=0D
  4219    Thread-2219         467    7,921=0D
  4219    Thread-2219         468    7,929=0D
  5202    Thread-2219         464    7,909=0D
  5202    Thread-2219         460    7,889=0D
  5202    Thread-2219         459    7,884=0D
  4219    Thread-2219         433    7,771=0D
  4219    Thread-2219         433    7,771=0D
  4219    Thread-2219         434    7,778=0D
=0D
The process grew from 85 threads / 4,140 VMAs at first fork to=0D
434 threads / 7,778 VMAs at last fork, showing these are long-lived=0D
heavyweight processes that fork repeatedly throughout their lifecycle.=0D
=0D
Tracing tool:=0D
  https://gist.github.com/zhr250/ba7725d0ea55594bcafd3cd4806eed98=0D
=0D
Hongru=0D
