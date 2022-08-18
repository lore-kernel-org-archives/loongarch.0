Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6B43D88
	for <loongarch@lists.linux.dev>; Thu, 18 Aug 2022 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=svR+yoOPSrSXWAW1XY+GCBqGqHc0nqWTSo5LsA7HB+I=; b=IKxGJO/bQNPqGYXPmFdsNkvaa6
	QGsS8UsO6g9MBP7P1y1UgW3KGzgdL4NlW/nzBs2MNUKkHPeEYdpMkc3EgA1w1qiqf7ioaC1cFioYk
	KeFraGZ0klqYvFSqUShhtUF5QkAR/I91kyVXH5Sfmn4z4UoixqIcMRZST51KuR8xuaPs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oOeR1-00DjsL-Sn; Thu, 18 Aug 2022 14:15:39 +0200
Date: Thu, 18 Aug 2022 14:15:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	Feiyang Chen <chenfeiyang@loongson.cn>, zhangqing@loongson.cn,
	Huacai Chen <chenhuacai@loongson.cn>, netdev@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v2 1/2] stmmac: Expose module parameters
Message-ID: <Yv4ta5tsYmv6WLx9@lunn.ch>
References: <cover.1660720671.git.chenfeiyang@loongson.cn>
 <5bf66e7d30d909cdaad46557d800d33118404e4d.1660720671.git.chenfeiyang@loongson.cn>
 <20220817200549.392b5891@kernel.org>
 <CACWXhKkJGO5PV8kBurR5Urf7XAiDKgX3b6epn0SPMkZdBH6iUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACWXhKkJGO5PV8kBurR5Urf7XAiDKgX3b6epn0SPMkZdBH6iUA@mail.gmail.com>

On Thu, Aug 18, 2022 at 02:41:11PM +0800, Feiyang Chen wrote:
> On Thu, 18 Aug 2022 at 11:05, Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Wed, 17 Aug 2022 15:29:18 +0800 chris.chenfeiyang@gmail.com wrote:
> > > Expose module parameters so that we can use them in specific device
> > > configurations. Add the 'stmmac_' prefix for them to avoid conflicts.
> > >
> > > Meanwhile, there was a 'buf_sz' local variable in stmmac_rx() with the
> > > same name as the global variable, and now we can distinguish them.
> >
> > Can you provide more information on the 'why'?
> 
> Hi, Jakub,
> 
> We would like to be able to change these properties when configuring
> the device data. For example, Loongson GMAC does not support Flow
> Control feature, and exposing these parameters allows us to ensure
> that flow control is off in the Loongson GMAC device.

Two comments:

One patch should do one thing, with a commit message which explains why.

The MAC needs to tell phylib about what it can do in terms of
pause. The MAC would normally call phy_set_sym_pause(phydev, False, False) and then
the PHY will not auto-get any pause, and as a result, the MAC will never to asked
to enable any sort of flow control.

   Andrew
