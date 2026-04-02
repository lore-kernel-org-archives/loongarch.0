Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4B730B50D
	for <loongarch@lists.linux.dev>; Thu,  2 Apr 2026 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137085; cv=none; b=IQN+w90c9eq8FcelUxlIT+wsujx2kGj6RvIUAv3S6rcVP9OZEyLbsa62/EJV+WXdqcNycy/xEvTmnO1H3lCuKiVis0RWuPkMpDpDM04jLaZ4kIWHXQ+wB8lWN/Pn4yJkikhNTQV4JS1DX+VlDXehF1EZXADeyHfo+79iERNcpvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137085; c=relaxed/simple;
	bh=bq0TF4RnqiidM1cV3rqx3snJ+Hzj+u9hvrZVbBcoz0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yh0OCqH3pwLsp4vo2AtVD+imaNyFckjcOCu19CFvuqRG3/dKNafwOJCriGDeZK2hJKImacY4VtcftsP+M3izlK4+EM17Pi+pg+uWsRKV3rWKv2xTddVwwrf6sHpepZZncgJ4WbrP0dmzxRzxa+STSGfpn2ew4AZhoSa4c+ErklM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bCQgimxv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bCQgimxv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AFFAA40E0176;
	Thu,  2 Apr 2026 13:37:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oTdXorvwZNA8; Thu,  2 Apr 2026 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1775137075; bh=JXSTWyXJ+TnyRw0WBxA8l+YYXyO0fVka0N6NTBeoq8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCQgimxvGmerirQlClnnYZmqi+uWMoqL95VwwSjtIF+Vf5UgtTcb7MS8LHreRfpek
	 GoKJE6bZ4mED1jv5T74akOqGqj6cVX0+gMq4JPJ5IXhW1g4caBQiG82F44yKCaUpHB
	 JKWGY6mrqIRGR7O4FfRKFTim4d0LlcNUNCcKJP5mrqJnhW7Zn6VsSiEjgSCPhKlRdY
	 Vz5bw9JgpcSP6iZZbF2pLqppz547O8r9pCTuwtdspA8PUUwCXcWPbXdcKb8H+KtEnA
	 vYV5UH9kk2R5DT86KkZXWL5/mET7B7l3QZkYztBFJ7a0PvDzmo/YIDl+Eg84lF8N0f
	 cXFNcJJV2IRYckfYEkZhkVrhIiorIFlejmBkiW959HnGweu56QSzj2gTTWdAAaJrrS
	 sh9Pp0D8Htj2up7P8oufGTYxoz9qRnLmpXA57NNz0RGrJXhZpOkLL3aR1nA9urPhxQ
	 tbt47maHxAeQaYmg6AyhXHj67cdIJvhQE/sb9BqBhp83IhtTGVjXBGdkhdgPdJ185q
	 K69pAch9YdpEB836VpaYWFh+Ip6YTtKtLGaP4i3L7l4LcOjBagTb6CrVT7jaRTwuHJ
	 Al4nQrXZYlR6lYI26Sosm0aZwIokhEkI8od4RIJbjj59kdoSLsB5B75aVXY5ViEq95
	 e1RjUlJ3M2nuatbtPJRqSTio=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 59DDE40E0031;
	Thu,  2 Apr 2026 13:36:50 +0000 (UTC)
Date: Thu, 2 Apr 2026 15:36:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
	bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com,
	rdunlap@infradead.org, peterz@infradead.org,
	pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
	paulmck@kernel.org, lirongqing@baidu.com, rppt@kernel.org,
	leitao@debian.org, ardb@kernel.org, jbohac@suse.cz,
	cfsworks@gmail.com, tangyouling@kylinos.cn,
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com,
	hbathini@linux.ibm.com, eajames@linux.ibm.com, guoren@kernel.org,
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com,
	vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com,
	fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com,
	takahiro.akashi@linaro.org, james.morse@arm.com,
	lizhengyu3@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v12 00/15] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <20260402133644.GBac5w7OYl9MwvVxY_@fat_crate.local>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
 <20260402113137.GAac5Tmc5b7SL98KdY@fat_crate.local>
 <c6eb858c-5275-6fdc-b6e9-bd6d4b169e05@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c6eb858c-5275-6fdc-b6e9-bd6d4b169e05@huawei.com>

On Thu, Apr 02, 2026 at 07:47:53PM +0800, Jinjie Ruan wrote:
> Thank you for the reminder and for your patience. I apologize for the
> frequent updates; I am becoming more familiar with the community's
> workflow.

Yap, and you can use that time while waiting to learn about it:

Documentation/process/

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
