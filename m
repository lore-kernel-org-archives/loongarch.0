Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD619632
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 04:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EL3pDOR8xSomCN3igCFGNEClMfvwW0Uw+a3VeiOR3js=; b=fm2hltAgLNYCtSdU8pq959unN2
	vMDfjLv4kIe5g/Zc6ICJjFmZ8Pe6H7oGAhE2GcTPtDMo07TfHvcimlMFhmGH9k/4iRXRNAOMlydFt
	MaAsamElH/djK4cgX0ycKFJ94xt+uHnDBQeExY47LhkjEjx+20IoaYC83LlNzhM+79+I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qJnWt-001CU7-24; Thu, 13 Jul 2023 06:02:11 +0200
Date: Thu, 13 Jul 2023 06:02:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [RFC PATCH 02/10] net: stmmac: Pass stmmac_priv and chan in some
 callbacks
Message-ID: <0ed12e00-4ca8-43dd-a383-ba6380f21418@lunn.ch>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
 <a200a15b1178dd8f6b80a925b927d30d4e841c3c.1689215889.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a200a15b1178dd8f6b80a925b927d30d4e841c3c.1689215889.git.chenfeiyang@loongson.cn>

On Thu, Jul 13, 2023 at 10:46:54AM +0800, Feiyang Chen wrote:
> Like commit 1d84b487bc2d90 ("net: stmmac: Pass stmmac_priv in some
> callbacks"), passing stmmac_priv and chan to more callbacks and
> adjust the callbacks accordingly.

Commit messages don't say what a patch does, you can see that from
reading the patch. The commit message should explain why it is doing
something. 

	Andrew
