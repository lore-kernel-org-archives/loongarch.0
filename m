Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7931CFA4
	for <loongarch@lists.linux.dev>; Sat, 11 Nov 2023 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="wrf9XsfL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=A4RnEtUcfGm5L2IgI9SFGuT20I3jVtUiO6RFteWI3XM=; b=wrf9XsfLHifjA9q1u8pIq7SLf3
	17fPOELfCyalN1W8Hvddw1f4Y2mAIdf+thxjsZSASQD824e7qRyyCQ95xHW1oqAr8MiiZzCz8ASL+
	2ylwRDoDNEP28EH4MHcrnL7YCpuqrYAQ8Pd/BtDHWinc80YzvJKEONKteHRJFunTTxlE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r1u1M-001N62-W0; Sat, 11 Nov 2023 20:51:56 +0100
Date: Sat, 11 Nov 2023 20:51:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	fancer.lancer@gmail.com, Jose.Abreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	guyinggang@loongson.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v5 2/9] net: stmmac: Allow platforms to set irq_flags
Message-ID: <111eed66-afd6-4ae9-acc6-1e32639051cc@lunn.ch>
References: <cover.1699533745.git.siyanteng@loongson.cn>
 <e18edf4ab0a83de235fa3475eee4ba8ac88ee651.1699533745.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e18edf4ab0a83de235fa3475eee4ba8ac88ee651.1699533745.git.siyanteng@loongson.cn>

On Fri, Nov 10, 2023 at 05:25:41PM +0800, Yanteng Si wrote:
> Some platforms need extra irq flags when request multi msi, add
> irq_flags variable for them.

It would be nice to document what flags are needed.

You also seem to be pass the same flags to all instances of
request_irq. However, the flags should be specific to one irq.  So you
need irq_irq_flags, wol_irq_flags, lpi_irq_flags, etc.


    Andrew

---
pw-bot: cr
