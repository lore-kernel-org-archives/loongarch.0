Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220614B95E
	for <loongarch@lists.linux.dev>; Mon, 19 Aug 2024 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052948; cv=none; b=VTLBa0gi0oWVq0B/EEry6llG83Pr/bZlt0YZPlAhhaRGTeS6v9EK4jeSjbliLHhEm+byuz2K83I+Aii7CcvlBDTLsQgr7iuALAJlQaIXj6san6DzvjUTMh9amOHnlxc0A9SgICXpmOdC6/02C/q3R6pXqX+ieracArAcVVAUUyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052948; c=relaxed/simple;
	bh=spq6B6sb/ZIFGYSOPazEWb0knQr9sjtzp6ILO0qVbpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A85EOX02iVsDd7ropAlijNFPPckwgHO5CQJRwvwBocLNLcLUvO+0VTOlIois6poPdiYNn8hT3+V9GW4+ETEgzHtsrSugnOFwnvybHBZsv57pcrZvXWLVKgBfsb6jfYo9pP96CWCODspMiOeCMRzxthDNjChFs7q5R1Ozjzv0l04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=d1QYJxMC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="d1QYJxMC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a83597ce5beso603081666b.1
        for <loongarch@lists.linux.dev>; Mon, 19 Aug 2024 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724052945; x=1724657745; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NyA3r+0SEkxLBULpRBSrNH9reIkd05NfXfPtxwYdwY=;
        b=d1QYJxMC0qn1FV7XmpGqVj3VDqy+hnQ/pymNnvLjvb7CMVJDD7s/VwoWby3VHqxQ2G
         wJBdB+KFqLGVSd+Ep98KMSm8083NRl505Posl9wg7H1LmrUGngCVaIF+fa3CTEJ7zY34
         GfBS/a0/qPA7KlzmdOoq3D8RIZu/K6a5+V5uQhF0eqA3FoNX/aCqzZoMwPhl4VdCqhHT
         zAi+T8wLJiopSmvnG6Tl+LJMVawRawAdqBEmCHkEqtEKwvvAxRW0UP3D90wyjJbhPG3Q
         /F/n9JJhdtwZU0KllDMHPqTUNgBP+pE0YFvvTRQqaUBYNiPHoP/zZBvQorj/iEf1uSed
         terg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052945; x=1724657745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NyA3r+0SEkxLBULpRBSrNH9reIkd05NfXfPtxwYdwY=;
        b=NsXA4/EtQknWR/EHQuHStF8UpKwgRYZ4q9qYYN3T41DKykwMntyolJA0xw2Yc5bZuk
         qYf6rFweOCbLHwM8P1Dl0nRJaARMCTo4Wrb7hI+qubqlLhtSKvPelK06i+LCQ22/Vo20
         f1mcqIVbPcjgLXGMuSgKFlj7YDaCnhVCB4FGjlQzbB0sn+QK4mhdMKD3g6a5g7Mj/yw2
         ibAAMwXqA6WHTwWtPQO7yUlmrpLPAPUkHcSOzBpjdgCFA286VYja2SLAISbLFdpegTAK
         Xhl2Ea7nt678HW0tjUc7NpbK03ha7LUhYiK1DVTe1BVW4IlBopkI/e8jBRYU0ExAYdxa
         yv6A==
X-Forwarded-Encrypted: i=1; AJvYcCV+gyIiLcNgGmrkyD4K85NGVSwWPSVTvto1OqIIL9wEn9F9Ef5ABDMmM2GUHQx4skN21JAtyDU6TDKkhL/6BZLTHuOUwfCmEL5m
X-Gm-Message-State: AOJu0YxZpvIMCCYcjc0yakRI3qmKutNDTM79sJJWXAA1LqG4vhO8JdcN
	4TGcLrQO3Eg6Gtu89a3mR10E16b8EZ0tHZnRV7TxlDAcL4kinLdPWaZ2w0agWR2kI8Gr2BXCazU
	NCZA=
X-Google-Smtp-Source: AGHT+IFGNW4Rp1MF9pErnW5tAeVHGUBzNbSFgBGlimGRBnHwWDOlPps9HXt2/6wAXUpzwZnZvX8mQw==
X-Received: by 2002:a17:907:6d2a:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a8394f7e0b9mr963569066b.22.1724052944878;
        Mon, 19 Aug 2024 00:35:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6c07sm603195566b.43.2024.08.19.00.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:35:44 -0700 (PDT)
Date: Mon, 19 Aug 2024 09:35:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, maz@kernel.org, mark.rutland@arm.com, saravanak@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <20240819-3fd4ff3cfa1d216a1241f5a0@orel>
References: <20240817074107.31153-2-ajones@ventanamicro.com>
 <20240818161816.GA173148-robh@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818161816.GA173148-robh@kernel.org>

On Sun, Aug 18, 2024 at 10:18:16AM GMT, Rob Herring wrote:
> On Sat, Aug 17, 2024 at 09:41:08AM +0200, Andrew Jones wrote:
...
> > +	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
> > +		d = irq_find_matching_host(it.node, token);
> > +		if (d)
> > +			return d;
> > +		of_node_put(it.node);
> 
> Pretty sure the iterator does this for you. I can fixup when applying.

Doh, I managed to mess up my usage of OF APIs twice. Thanks for applying
the fixup.

> 
> I plan to tag for stable too.

Good idea.

Thanks,
drew
