Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D980D51C
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738059294; cv=none; b=lIBJ/E1h0jA9+difwr0NdvHGfledGxdv1HlmAilyZ2Xgc6nPuyM2J2TB7kfEY1H59rKcs5enhd8Ao9woyj05C8/rQ3P5dd5wmwqqHEBkwQZHN/36MNRNOoQjGEnSD2kR3OmcHv+R7DpQRwz2zfgLLAJ/Wc2aPFAb0vpPXo9ExPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738059294; c=relaxed/simple;
	bh=5lvs8HiG7TGF6/vHKmJWpTOuUvsPsw8S5GITAUAn4MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ba3Q++2fOfnFYc+fN9lh9VnuGhGM9qUEnpjid1KyBX1Rk2slDT7ZmDzRP0v9MA7wCNSW6fJ6n6xYDUPmgI3L49UiISfqgFxigzr+qPmUpMcMukWnk3Ano/6Dyp26QwtApaT/XvqdTQlrGKQg2Gq1PwGS89WA1a7K92XpIfLHvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=U7oqzcEt; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="U7oqzcEt"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467a17055e6so59337541cf.3
        for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 02:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1738059289; x=1738664089; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+OJo5OrtdbsUfbDREZKvi2Xm/rwCKQG5dGU4viVWio=;
        b=U7oqzcEtOU0NxVsoyHpG/iWX4ZVJ/toL+KxxzHLjKySxYJMYId6lvf8oH4qBG/u3eG
         71eqZExE6SKfRvtQl67qf60yKcubvt5wP5w4R4zgrx2a5HJq7xAtGXu3kXxqC6eySux4
         f6mdZQdskkjYSyQ28kAjBDNKT5AXtDOULSczbDFkVIYPtnyI+XZx9nIN4zuT1PLkV4Xr
         jafNDeVVKHDRKROkIPnRm7vaXbqi3VP4QB3LnYrxxrfBDtZe8TXGlOZS4jXwEMRI/FIW
         dLCFQno6WihV30w21FMswZ5tSgSKBsqVJXitwMz9mxMynV7ScjDOrXpkGDgNXIpgCwsO
         3j7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738059289; x=1738664089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+OJo5OrtdbsUfbDREZKvi2Xm/rwCKQG5dGU4viVWio=;
        b=oCAbI+Y31yI03/lHfIzAM/pw1INCMv4Xc/lm3uBLLmURvymXYf+7RPyiwXJzhDzFFv
         SZArebbvgSpe6m7IURGGMfIESL7SrMTnWscVphFHAcJWzW769xGB8u2SHQRsVVENGGIz
         46X6DtUNrpQSeEdW5lwupgSRTCW5S8ByCDAe36z2u1v8gRd4RORhfrWeb/mwRQ9NCTtc
         UIYumhRZ/taMZJMfEnwMe9kJOAb/gDv7QeIbq56En4BC7X2Ul1AkFt0I4PnMYpl+0NlD
         e1gNN577bZp2XwOblT/0xYv1HKLgul37i60ETNYjDWfp22JsxU1QmiYCBsyrCpqEMW3h
         yUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEIpYlQXFjjaiKfbgiWqNLvsqpU44AGvpt+PSfEHDBzsTHgFbXhLTXkNEIB/0/SGNQaOEbLQLIDdg=@lists.linux.dev
X-Gm-Message-State: AOJu0YziV5CjGMKGBnS4AawHusjpbfycbfxbudcmtaIVhOr+RL0ABVdH
	B4uiF+WR/RtTAWeY3lbqr6EOndVzTcwHBjkrxt3EjvhQ+vjoC4WL3yHctZNNc+SWiu6FP+BSvbx
	V
X-Gm-Gg: ASbGncucCRpMLhRTJSGyQ3AkR1iqVMQnUjou/9K7c8g3ao4olK8lvWil5qixVLjdm0L
	06ojjp9skAC7bUTYmluuFgMETo6MFgPE7PCGTBfKB8m1+q8cQblcp15PBg6YYaYKjiuyUdcHTge
	l3ROGgoEyPiYZixflceuYfVFy4eweJ3W6Nxrm4ytiEL1+7a5kMXywU4ZHyPDGAgvzdzF88pqWL0
	BTU6y2AZYsLHgHbFCmF7EvcBe45q1CwyEu+QltJd442Lr6J9HpEhT3AjBR3cnEPVBQBxg1zgXLS
	RDG/fNvkjiM7NA==
X-Google-Smtp-Source: AGHT+IFALe6WVLHYMuH9iT72w4NXQewmaC4+fVCySImFG7ZmNiWWkYcz7G2f61JtCoHmT0Mt8hGVxQ==
X-Received: by 2002:a05:622a:52:b0:467:6cce:44ba with SMTP id d75a77b69052e-46e12b96babmr592982961cf.43.1738059287990;
        Tue, 28 Jan 2025 02:14:47 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-46e6689dab7sm50327711cf.44.2025.01.28.02.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:14:47 -0800 (PST)
Date: Tue, 28 Jan 2025 05:14:42 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] mm: zbud: deprecate CONFIG_ZBUD
Message-ID: <20250128101442.GB691108@cmpxchg.org>
References: <Z5gdnSX5Lv-nfjQL@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5gdnSX5Lv-nfjQL@google.com>

On Mon, Jan 27, 2025 at 11:58:21PM +0000, Yosry Ahmed wrote:
> The zbud compressed pages allocator is rarely used, most users use
> zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
> pages per physical page). The only advantage of zbud is a marginal
> performance improvement that by no means justify the memory overhead.
> 
> Historically, zsmalloc had significantly worse latency than zbud and
> z3fold but offered better memory savings.  This is no longer the case as
> shown by a simple recent analysis [1].  In a kernel build test on tmpfs
> in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
> of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> sense for zbud in any practical scenario.
> 
> The only alleged advantage of zbud is not having the dependency on
> CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> zbud is only used by zswap.
> 
> Following in the footsteps of [2], which deprecated z3fold, deprecated
> zbud as planned and remove it in a few cycles if no objections are
> raised from active users.
> 
> Rename the user-visible config options so that users with CONFIG_ZBUD=y
> get a new prompt with explanation during make oldconfig. Also, remove
> CONFIG_ZBUD from defconfig.
> 
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Can we just drop it right away?

The two cycles for z3fold were basically in the "not worth bothering"
category, since very few downstream production systems rebase that
frequently.

zsmalloc has been in use on everything from mobile devices to large
servers for years. It's been the default since 6.6 (Oct '23) for
zswap, and the only option for zram from the start.
