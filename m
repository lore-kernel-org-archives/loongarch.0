Received: from mail88.out.titan.email (mail88.out.titan.email [209.209.25.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5F4155C82
	for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.209.25.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765877500; cv=none; b=uZgvmGnSOURyOpYzn7wcal3slA+XAUzyzN8Iocgj+TisIQlvnLqPlnjWe5/kKuYHehR5EODIANRO/FflM/+jlDPsdFMBAqwdN2ZPJbyQ8RLEAe7Bc9Mkh9jWo4Hmi0BeW19GRLRWkslTvE/Msl1GmamD0q9NaREq5ZUMpgmoU7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765877500; c=relaxed/simple;
	bh=QGg6sb2yB+41BEaYLZygHIG+7cfrrZARIjbJCAtn3rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMUuZolKZW5EWXUZuD4XTP5l38HhWSaPDGdaVXmF4yv1ZhXnFj0UonXnm5AGj9NUrv7oS4mv5AwjtlUt/vxjw/hnayHPgGriKh51G1LWo9o2KbY6qKfwKaGTudKZOaZxV/+nUWrVRDGm5TCoWHrGKok/q5rcc+l7emZD7ajwqbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b=iKCo1Znw; arc=none smtp.client-ip=209.209.25.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.b="iKCo1Znw"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dVsBd1DZ9z9s1K;
	Tue, 16 Dec 2025 09:31:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=qEuALlOiDJ9ZM5Kch+ZSeYflabXsN0k3ETWKl4Tcqak=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=message-id:mime-version:from:in-reply-to:references:subject:date:to:cc:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1765877497; v=1;
	b=iKCo1Znw/mjhAX2JNSmn9nQxSVZHXrCWmBPMVh+16Q9qMoLSUsfEzpp0EwlkOgJ+zHbPxlAs
	b6hoD118G7L8nBkzuI8pzNhyVYVdXazKosdQO+FRHfcwMr7utZAcYlIaJ1Hxb4ktqbDzfQqEaZl
	00GkJ+8I96DDgx4nf8/xfP6c=
Received: from pie (unknown [117.171.66.90])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dVsBY3hPdz9s0L;
	Tue, 16 Dec 2025 09:31:32 +0000 (UTC)
Date: Tue, 16 Dec 2025 09:31:28 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/7] LoongArch: DTS: Fix dtbs_check warnings
Message-ID: <aUEm8E-aMC4hGuSA@pie>
References: <cover.1765778124.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1765778124.git.zhoubinbin@loongson.cn>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1765877496992165586.21635.5869125783113741254@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=TPG/S0la c=1 sm=1 tr=0 ts=694126f9
	a=rBp+3XZz9uO5KTvnfbZ58A==:117 a=rBp+3XZz9uO5KTvnfbZ58A==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10
	a=UEfRs4X7rQmhpc7QgncA:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22

On Tue, Dec 16, 2025 at 03:54:35PM +0800, Binbin Zhou wrote:
> Hi all:
> 
> As Krzysztof pointed out in the OSS talk, LoongArch only has three DTS,
> but has a bunch of warnings. The patchset attempts to fix them.
> 
> Patch-1 and patch-3 are taken from Yao[1],thanks a lot!

I'm fine with it, but should you add your own Sign-off-by to PATCH 1 and
PATCH 3?

Regards,
Yao Zi
