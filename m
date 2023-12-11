Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4B24C3BE
	for <loongarch@lists.linux.dev>; Mon, 11 Dec 2023 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uiSOGsUE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rJnz7vJXFXZ+s+GFQzKJTUyedjcYLhX/g9SREbHLG/g=; b=uiSOGsUEndY59UZcDr2nsLhwOC
	xvo3UYY9rZM2tEcqicOJ3+pK/HBNuqe8cRF/YePTNrlnG4zEVCdK0AQjLk3MzTpYv281FU9lszRTk
	qm6YETmBLeEz0F19k0Zqua9SNRnhKuRhLxo46IPt3fYZDgibBA6L+ErLtap/OcZnqgF1BlymMVgOc
	cqM3QsrC/ZEXXIn0sLxNA0LePNNoq3DFdu9Wg+6cZzvuax1t/aFd+/trtecIfsjyJsWT61Bg62uor
	t9PGL3ktjHrepi3yXR3LcVqoyoHO4LJKUBN/egey8BXily4PDedmA4YzBp/8DmxqoVw7capk9MQAX
	jCcMos6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCioq-005epY-0W;
	Mon, 11 Dec 2023 16:07:44 +0000
Date: Mon, 11 Dec 2023 08:07:44 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 06/12] LoongArch: Implement
 ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <ZXcz0NVitD1pQJ5V@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-7-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-7-samuel.holland@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Dec 07, 2023 at 09:54:36PM -0800, Samuel Holland wrote:
> LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
> asm/fpu.h, so it only needs to add kernel_fpu_available() and export
> the CFLAGS adjustments.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
