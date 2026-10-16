Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992A1E98EF
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129397; cv=none; b=QJSVSagE3anZxbRxok34B+yLVcvzeX+bnpsScEJxKq29Su7Oj1DU+49B62TVZflQ2+/lB6pGcAaFeFH4Vz8r3jGYR/I1OCNJ5DcVCAOkAEpE/b3glnTTKKs5YzkUDd+2wAsm8aLOIRDBCKBjRqnNqJZru2AMMnW99xh5IXE+P5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129397; c=relaxed/simple;
	bh=NEakvsaOGnuVnV0CYglxQUSvVlGwlWIB3RhWn5msuzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nb5zolzfMCw365wagGJws5HUQ1vkO0qxcbBvsUsePNARFMfK7q/72olcrQKwIMJehokSH8SLgU1aGxfhGpgw45AX1YEFpMbGv+uHoPxYmFWYJVsJb/tFo+JgClcRaypBPJCZJNkQ+siG45hOc8d2+HRbLpZ7Tt2C/IHLiIFZDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBaq1H3X; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBaq1H3X"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so14518225eec.0
        for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792129395; x=1792734195; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SoitKqT2YG6pddF7f7ztD4Qh7MmMeAXctnSL8wVenKQ=;
        b=YBaq1H3Xlb142GKwHgY9ub7rOdV4nb1zgj6WdUcYgVg8HWe4HnMYWyQevbI2IqMCwe
         aEZrvF3td2htp7pCl9swxxgOWx7GvgwWK/y8KhnfUdITrmZMpTFwu23IAjI7zmJGqnHe
         A/wL1o2QP1GbSX/nqSLONWi3KcMGTO17oSG8jhZ8WR8j2wq4LoS5PBnt4+l+zHeBWbTv
         W4KGyRh/GINsJlTQVAgC0+BRpmne3w4EE3md7SWTk3Td88yjnv/rnpvbL4/mJTXVg1oO
         Q973YI6lGcezIBTTP36oBX3h1VeupqFpZ1aVdX+p7J8ljeemgx/0YznjbJKn8/7dGvpe
         pT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129395; x=1792734195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoitKqT2YG6pddF7f7ztD4Qh7MmMeAXctnSL8wVenKQ=;
        b=wkzljaClQpb5uEOvNlNloBIOzt9lifo2q/pftYZv5BTsvL8JlP5/1GPOeVuHoQGWk5
         M63di4fyAuEl9QwzbynmDjvuHb62fX1mE+zWo28uUghlR1qXfNAmHSezVvitRX9nJNZE
         sJzjOnkngzlbBtASkVX/JTEzWajMAG/bezASqSX320TW0xk/NnzMSUZx0RLy+Ija6cF4
         MG/QNucujSwD/3XT7IKQE+9CG4t8qNsoU9laQoiro98ZHPfnRbHzpo9KA0ZuqAN9JHsr
         BeLazivQ2N6lEc0i6j6uWwoIW92TcPNJvkXs7PX3BoNWjJRPj8ghqk+IzCBwQGBpMHLh
         VJmg==
X-Forwarded-Encrypted: i=1; AKwUvBxf1d43Ot77f6KP89Cs2/I9+QY9kprTtBc96fkYxRZjPCsCtMB6+SkjBPvenPYQqwxhocP4acVcE4M=@lists.linux.dev
X-Gm-Message-State: AFq9FYJvK8t/hp5GQ1sTBiaDqINGr/vhmN4g4Ff3oJXcPlxvVNw1Qpzs
	yYo5gFX5AWg0cIbXP0NfXS7WIQtEkMNfmnMfD9pBuC7GYisTM+vdi1axORAP/cQYLVQ=
X-Gm-Gg: AYBFou21abvmW0VmeIhmx8agz6tP8smyRzeGnmDw0YpKoQGdCVsieMF18pgutZZ3yCL
	8X2YsjI4vxwGBYhUZ6O3qk3QX4beb+5R9zRwBCf9ZYOW6MWaLyChz1kAqCuyNX1RKFbPB8DJ9ur
	6maK497iaL8FTsgo9pJqpo756AOdz1vlYsbnrvOTe3kk6EVQ7dJwiuetQWGL6JGJWiOsK1XLtc5
	0dnhG6I6SfRrfuhJaL+RdvcTzdna2zuAxzU8MdUu/z/Q9L9dsn9/K/nMxhBoC43sv9Ejmi+2vIG
	hkcjvgJ3FbdalvyAl5qI0vOYamDj8QO3FjzgKh8OPA4XnSgcz7LPi7m/JHkLbFRcOAhUBBWbUhx
	AgfnPGOHGf3E1RulP6u+MmmYfbBaGKjOOpvZBBgqNkWUpjePBMejx9QHhc5WZPT4lvBLOf//8jI
	h3FaRjYRL7N9i5GcGUalhUwo9FOjssNWK1ibn0CS/14YZX0zeJRwtz83SXuIyRgqfXWeZVPcCR
X-Received: by 2002:a05:7300:87:b0:360:c266:cddf with SMTP id 5a478bee46e88-360c266d46amr1079687eec.5.1792129394732;
        Thu, 15 Oct 2026 22:43:14 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm5889667eec.24.2026.10.15.22.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:43:13 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:13:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH V2 0/5] cpufreq: loongson3: Fix wrong behaviors on
 multi-node servers
Message-ID: <atG5bnTzhSKljwH9@vireshk-B250M-D3H>
References: <20260828031201.1500767-1-chenhuacai@loongson.cn>
 <4db03770-b410-4298-9e32-d497278e9cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4db03770-b410-4298-9e32-d497278e9cfa@oss.qualcomm.com>

On 01-09-26, 16:01, Zhongqiu Han wrote:
> On 8/28/2026 11:11 AM, Huacai Chen wrote:
> > Our server productions (e.g. Loongson-3D6000/3E6000) can have multiple
> > nodes in one package and SMC mailboxes are also per-node. However, the
> > current driver has wrong behaviors on multi-node servers, including: id
> > field in smc_message is too narrow, mutex is not per-node, IOCSR read/
> > write can only perform on the current node, etc. This series fix all the
> > above problems.
> > 
> > V1 -> V2:
> > 1. Fix typos and add Fixes tags.
> > 2. Fix loongson3_cpufreq_get() return values.
> > 3. Use nid_to_addrbase() rather than hard code.
> > 4. Guard some code with CONFIG_SMP to avoid build errors.
> > 
> > Hongliang Wang & Huacai Chen (5):
> >    cpufreq: loongson3: Make this drvier depend on MACH_LOONGSON64
> >    cpufreq: loongson3: Adjust the width of id and val in smc_message
> >    cpufreq: loongson3: Replace per-package mutex with per-node
> >    cpufreq: loongson3: Use global physical CPU ID in get/target callbacks
> >    cpufreq: loongson3: Replace IOCSR read/write with MMIO ones
> > 
> > Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/cpufreq/Kconfig             |  1 +
> >   drivers/cpufreq/loongson3_cpufreq.c | 72 ++++++++++++++++++++++++-------------
> >   2 files changed, 48 insertions(+), 25 deletions(-)
> 
> The whole series looks good to me.
> 
> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

Sorry for the delay.

Applied. Thanks.

-- 
viresh
