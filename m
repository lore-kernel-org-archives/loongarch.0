Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2C4C3B8
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RjcBeA1P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NZSOK9WEf75MklfPNXGRllooeOJSKTH5cik2mcCApGk=; b=RjcBeA1PdEk2uyx9kR1h0vqfX4
	d+Yc1bRexIwPfEwXg3ATjowaawQ6wbOG4OgsjFrzg9fZZ0zJjukp6Imd5SFfd6ha0kA/qXRd422Fj
	Nhph1TZ3Pc+KZkOBqTAhjpSdNUTZ4lvJm4jQdxcrZ6EH/+7GL/IpZ/YGrUXp0g36nBp1dXbu+km6G
	+7cIhUBiolRpN6/Ql8tIJaxRM6dJVqbtp3VdZ9gpozS3qBe5ggNJiOclYFTG63FNxCesa9LKP1zlK
	A4pSdsV8BAmR9z2J4zu5mvlp3sRTQk30uEx9FjlxHopEq0ezrXH5BU7JQ5+CFAnadouB17RK0IYsz
	HlvRlvVw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCilJ-005dCw-1o;
	Mon, 11 Dec 2023 16:04:05 +0000
Date: Mon, 11 Dec 2023 08:04:05 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 02/12] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <ZXcy9YUWrC586RX+@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-3-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-3-samuel.holland@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

> --- /dev/null
> +++ b/arch/arm/include/asm/fpu.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * linux/arch/arm/include/asm/fpu.h

Please don't add the file name to top of the file comments.  It serves
no purpose and easily gets out of date.

Except for that:

Reviewed-by: Christoph Hellwig <hch@lst.de>
