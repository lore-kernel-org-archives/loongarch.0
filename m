Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BE419F431
	for <loongarch@lists.linux.dev>; Tue,  3 Sep 2024 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354098; cv=none; b=PoN5o14ofKGAOkG0SPxfKFTdbCT61iw6V6BdWdV3LK64ZrCwK3TsGeT1HiPQFji8mboGZmKxMHIZaJmN1rmeP8ZDHShOOnm9a4xsXmwafvfDEvZs2nzHk5NuVUnzIf1/iQfcFJk83TnoCuhIJOAgC1VREMwUVA6TjauAhzeiXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354098; c=relaxed/simple;
	bh=XXc/crLCNHxzSDDZAy6Ddze/85mA/zk8QXL4gwHqt3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/wJ1yPhQR1tCG4vmmmErpxauNPuFoIIt+3h7lADvYqrPm8FfuTWn2Yzq8i+qcwyioRzccG2+5o98OzO1eoFYjf2A7kt+kaTYWmgxP/AqvJOVpXJB+IWIQ3FVcuON6gtGmU3vRf3fqO/2eoI9fg0RNYVZgV9ElWgiHTg3e2WZwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5XCc2uf; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5XCc2uf"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d88c0f8e79so2278676a91.3
        for <loongarch@lists.linux.dev>; Tue, 03 Sep 2024 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725354096; x=1725958896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cwokYJJ36zRTwb7Es++/p8+iOX4crE17pq6UetC4fjY=;
        b=K5XCc2ufwR9lbmY0NMW3RUhni9QsSV69jmLcePpRJsZtk8/4rBecR2pCMf7Q7lFmEU
         ilr+mVUsWtX+tS2rQGT/SVFs+Nygj0KX+rR4iAQYOZEu3KGjiLB5a3fphYYxmOhFiInC
         L0W8UiUbny7ye92Mv9711LF/yscGriuKwh+5qgnn3lHdfcTtckmBvRfS/SNJhHsj8pQF
         aRIi1PGX0yPRvZhVi7gvBNsIQVcMY3uv5+OtSsdQIrRFba7LF9xEuVHcnZtD3xwvxGOs
         CbjWLfI83QOU9epDqsye5ToImhHSc7ComMEH/GoSmxaD9WegO/Ix399X21W8bS3KVxWJ
         grdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725354096; x=1725958896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwokYJJ36zRTwb7Es++/p8+iOX4crE17pq6UetC4fjY=;
        b=oMP/BRyFGT+jcK+PCELsIUxa+U9hUqwR+ER2lZS++EvbC1ZMiSGtQ2br2xLwYeejoh
         pbwSxIv6jva7I1mbhPwFhOiKxGqgSriWhskf4nawgkHeHTEX7dsga9+K1Ilt2s/DDnMH
         j1vjKBnIiGirHGtcDllA9Skwb5RQMipvo+e65Hdo2hSuCG4VWh2TZ4/4Ud+KcwsF63of
         BGoud8mJpz6NatJmhGStihvckbmlAmgtqtomZm3RB1womWzaq5U4Bd/OBaJ6/xBGbzw6
         OKYSfOgtYtMofBXUgPCbHMCxk7FzvGN2rp3u+EnY3PYGlir/QA1bgoPiRDfvBJPHNpD3
         xdEg==
X-Forwarded-Encrypted: i=1; AJvYcCW7WieT+HX8kifqxoFvx0YAQUpb2hZ1xh50mEolGH1mzJK1sBj2MrBGo0ECHxCZKwZXfSohlzOASkU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ/kshnWxoTZIrmtCOzL1vx+1g0HhHp+twhm5I4EkaWag/oOOk
	S9DVxALuwCohcsPg4+j99DlRonAjHqOy1yRUuGxJYWjj1g1M+Pz2ZPn2mOvXoHU=
X-Google-Smtp-Source: AGHT+IHpyFwad5VKly9RnWl8Lsn1HCK4hUN/kvD8gp4deaWLKbgiLnxTpU8gsD2DZXdwowBQlTervw==
X-Received: by 2002:a17:90b:4b0a:b0:2d8:99c4:3cd9 with SMTP id 98e67ed59e1d1-2da7482c876mr189982a91.3.1725354096268;
        Tue, 03 Sep 2024 02:01:36 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b119b3dsm10803545a91.13.2024.09.03.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:01:35 -0700 (PDT)
Date: Tue, 3 Sep 2024 14:31:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Xi Ruoyao <xry111@xry111.site>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH] cpufreq: loongson3: Use raw_smp_processor_id() in
 do_service_request()
Message-ID: <20240903090133.tqmsitybuutzsup5@vireshk-i7>
References: <20240828062459.1853837-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828062459.1853837-1-chenhuacai@loongson.cn>

On 28-08-24, 14:24, Huacai Chen wrote:
> Use raw_smp_processor_id() instead of plain smp_processor_id() in
> do_service_request(), otherwise we may get some errors with the driver
> enabled:
> 
>  BUG: using smp_processor_id() in preemptible [00000000] code: (udev-worker)/208
>  caller is loongson3_cpufreq_probe+0x5c/0x250 [loongson3_cpufreq]
> 
> Reported-by: Xi Ruoyao <xry111@xry111.site>
> Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/cpufreq/loongson3_cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
