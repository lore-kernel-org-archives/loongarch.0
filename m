Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E54637160
	for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737948762; cv=none; b=BJ2f5Bxz59mpYSPLmZsaPC2LRQdbgFPK/abDRtHc5tK/3TAAiKMMRo9py2bcXZxDFTWh//OwXQSkL6JqrkVAFPOG2b1gyj4JdzGfZKlAkPqi0qANrQcOeV+2zmIgVKEiJLqJQufDwicw7JqRHZrfT89lg1YszXAVKZmEnGu4mLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737948762; c=relaxed/simple;
	bh=YiJT9WQLqKtxa/sdK0/rOM1AOUebCQeiyhpJpoFR/Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joAiM2xQI89VlCoIdkHdSPwiB1E56EhwaQd7Uuy8vGrrse6/7JhZcr24XOZ4H1lOkJVcn/t1sKSjly7YhxUZndJ4bOiWsHHogkrqaZufJqXa1G5EwBkmMYtEmhUJA3VMxz+wUTsCQsVlMiP3VNcePjsDgl3nTkRCOQNHYPF1cpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjLRcybh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjLRcybh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21636268e43so85269395ad.2
        for <loongarch@lists.linux.dev>; Sun, 26 Jan 2025 19:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737948759; x=1738553559; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=vjLRcybheqG1gwhGHdiTHFBE2aeqyak881iHYwFwac3GNs8z3wNAHSm02GyamkJ0om
         QjWnMboTk8F/0anTAIqP4zAmRmEtLB/CN1NiVhyb+vNHOO7Mr0wAudXTE3I04/2ez0Cf
         3nwchHTVHcb/A2fqQ4BfzzL9BAAVc76Q5unK5+KVFYeiXU6dromPtbjwGbXnNL9J3LmA
         RYWoII4disrKte/bjvg8p0tCYp+hV3YTsU/+BvgzilPkNtbT1lSo9BNidMt8hTm7BQLx
         8aBjgl7XbeLi8daS+Fdt5tdj5DIBxb7ws5CHJ5KloDpYmqNip4T7GGDfdbjBnLReH6Bz
         vxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737948759; x=1738553559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=GATu9Nkm4/YkVDEYEEy1fN3dxsA0CTWSDOOETC1zrEFwb7yg1rweqsxWUGUaZx5XLC
         VbiH8BIP33TX2zL4qgFGqFH22hEUAMOBLdaSLXB3RMnCJ2ns9bvfpy61KpLJbxJTXD37
         +z8aHgEOTnuvH/vHLnv1tkegkwHT6ipoTvGmVuD5Dd1aKcZAEH6mgYbZyUzPMHgeKryH
         35ABi/MDa+e0eURuAuM/ANPm3tF/QV9+Dh2nBVdUEZoBCIrf94jwzknA/LoB83fV2cM4
         XvqxGplhvTF6fMSSDrGUBT19qXeNdAI9vcytE1D+6YWokEga18nEA3N6ophhVxHXYfS+
         J7LA==
X-Forwarded-Encrypted: i=1; AJvYcCVraGPr5PL6T6wqQP2dgt7XuasoA6925Mtnw9+qFG8ESalsE4uoVXxgg9lrs4zQgUsCTXH571Sb7HI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbgOrQdRMkeBGk2SCvDv5R1+/Pisjx/FwUdmZE3wipR8rTDgY6
	89ZBQ6nq8GLkZ0pfZ7pJ4dob7AJMnFFx2zEK6zWhTI2UcO9nza3XCgP6F1F5EFg=
X-Gm-Gg: ASbGnctORwaHuWPaNYKHK1igzi5klhCAXLSR78bp2hzjEGwUsuJxfbyMEOsB6PhLlLB
	yV1ODYBLIlfpzKRkGRSdUNtILkwz2sBiuPgGrKa2zkHGOrsvCszPOxDy4NhAVVjNuNf1sncdzTD
	n8QdQdmLH2oqOAOHXItoPtZwIjRvNpDJoGDHYkhKJTdap3YTRcQ2qBqStUG8cSvoNl2YohKqazB
	xgYYvsUY8cJVvWZOxdY8mWkAIga9LPTDcVf1+vrU690yBhnf5QfJS7Q8wIz0rMQ3Z/AG60PlfOL
	1LCjPMI=
X-Google-Smtp-Source: AGHT+IHvgBNK3NhwKI9n5fMBriq7FLdQFhDFQyHQaZNGZxzhpW+eaG60WMmG2z8DBaIbsP1G1cn9Zg==
X-Received: by 2002:a05:6a20:728d:b0:1db:eead:c588 with SMTP id adf61e73a8af0-1eb215ec4b9mr65731325637.29.1737948759394;
        Sun, 26 Jan 2025 19:32:39 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbd01esm5342591a12.71.2025.01.26.19.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 19:32:38 -0800 (PST)
Date: Mon, 27 Jan 2025 09:02:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>, Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>, WANG Xuerui <kernel@xen0n.name>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>, arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 00/15] cpufreq: simplify boost handling
Message-ID: <20250127033228.abeqhrxoprqw5b4e@vireshk-i7>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
 <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>

On 24-01-25, 12:05, Rafael J. Wysocki wrote:
> On Fri, Jan 24, 2025 at 9:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > The boost feature can be controlled at two levels currently, driver
> > level (applies to all policies) and per-policy.
> >
> > Currently most of the drivers enables driver level boost support from the
> > per-policy ->init() callback, which isn't really efficient as that gets called
> > for each policy and then there is online/offline path too where this gets done
> > unnecessarily.
> >
> > Also it is possible to have a scenario where not all cpufreq policies support
> > boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
> > feature for that policy isn't correct.
> >
> > Simplify and cleanup handling of boost to solve these issues.
> 
> I guess this depends on the previous series?

Yes my series and the boost related patches in your tree.

-- 
viresh
