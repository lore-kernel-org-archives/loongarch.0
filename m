Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB60D539
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uhpvGTyQ4fBNoSpuf58BWfUPHY79XHQteoG31niFepU=; b=qH0HRN6sOtd2PftQ0T1YbESWWw
	nSGkM0U5FIUhJ4lEKs/zpzcgbDEs7MCneetZb+qJF5GVrlWvUCU7e28m9KdQ7NBY/1rO9ez+Lhg++
	4PRxeNOOaq4lDIeqJFL9pTiwHm+R+MFJ7dVW3OFGJMLuVhH9gxbygIUdK9AFCHAFWQq0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qOyLv-002RSk-4D; Thu, 27 Jul 2023 12:36:15 +0200
Date: Thu, 27 Jul 2023 12:36:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v2 08/10] net: stmmac: dwmac-loongson: Disable flow
 control for GMAC
Message-ID: <38591e4c-c4f1-4b6e-a9fb-57f349735bb0@lunn.ch>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
 <0ec0ae938964697010b3d035b7885e4dda89b012.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec0ae938964697010b3d035b7885e4dda89b012.1690439335.git.chenfeiyang@loongson.cn>

On Thu, Jul 27, 2023 at 03:18:51PM +0800, Feiyang Chen wrote:
> Loongson GMAC does not support Flow Control featurei. Use

No i in feature.

   Andrew
