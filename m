Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD2915AE
	for <loongarch@lists.linux.dev>; Thu, 18 Aug 2022 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xvFV9mDbC+6XIIPZ6fGxYqPoxuHHIEm3AawSJkUaPdY=; b=kIiWgiaB3MGeyXRR0du07t3pHZ
	39chriwBsHsCCIPENtMlxk6LUnOKhMo5FKq3vK4Z8OYTqXpPs4NFvyczrflxvWCxnOLOA9qQEpsiQ
	rcG0AmtG8ns8u6DP1+wxIAMZdZ1ZFocG1P9hUJZHOBrBj8CfptBluaDNEUjU+ArVuYBk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oOV7e-00DhBs-8I; Thu, 18 Aug 2022 04:19:02 +0200
Date: Thu, 18 Aug 2022 04:19:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, Feiyang Chen <chenfeiyang@loongson.cn>,
	zhangqing@loongson.cn, chenhuacai@loongson.cn,
	netdev@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] stmmac: pci: Add LS7A support for dwmac-loongson
Message-ID: <Yv2hlkIpd8A66+iP@lunn.ch>
References: <20220816102537.33986-1-chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816102537.33986-1-chenfeiyang@loongson.cn>

On Tue, Aug 16, 2022 at 06:25:37PM +0800, Feiyang Chen wrote:
> Current dwmac-loongson only support LS2K in the "probed with PCI and
> configured with DT" manner. We add LS7A support on which the devices
> are fully PCI (non-DT).

Please could you break this patch up into a number of smaller
patches. It is very hard to follow what you are changing here.

Ideally you want lots of small patches, each with a good commit
message, which are obviously correct.

      Andrew
