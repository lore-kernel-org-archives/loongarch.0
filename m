Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D954400
	for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 08:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2sAaLrskooSi8nvsTT1gZutPHlD/k3n7r5xvvnLiOwo=; b=QBd7SbC+MJyV7/yXKjWB2RO34d
	KMb7IKnce/09nxUE59vX+DyrMq3+3ksde80hRvh74PSaSNpx9BExmPl1tT8hQDlY0RRCJd27mzHGK
	jTdeDIlO0hT18cIDPNCv2sWkLYNVbQxKO/F8FFpL0xhC5EahRo6sBAWNxNYjkiU+yZTnaeMoZDi7N
	vOQtOf6oo94YWl5q6+Gq5wOBDtAnP8PQqGVvANP8rV9pNAVKAVwt2pMg7JxVv5Aw7DqavmpWtWPaO
	CZhjIO7ekSgd79XNaCXwEwqMMGk+HQle3BUi7KXOMEMggh5H/UUpQepU1YJ5vAjCWdgbeSfwJCEPw
	SsMRkJ2g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qBWsX-00Crm5-4u; Tue, 20 Jun 2023 08:38:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D951F3002F0;
	Tue, 20 Jun 2023 10:38:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id BCF1521440F49; Tue, 20 Jun 2023 10:38:18 +0200 (CEST)
Date: Tue, 20 Jun 2023 10:38:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Youling Tang <tangyouling@loongson.cn>
Cc: Xi Ruoyao <xry111@xry111.site>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, madvenka@linux.microsoft.com,
	chenzhongjin@huawei.com, WANG Xuerui <kernel@xen0n.name>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, tangyouling00@gmail.com,
	youling.tang@outlook.com
Subject: Re: [RFC PATCH v1 00/23] LoongArch: Add objtool and ORC unwinder
 support
Message-ID: <20230620083818.GW4253@hirez.programming.kicks-ass.net>
References: <1687247209-31676-1-git-send-email-tangyouling@loongson.cn>
 <bed4d386c16701d14a2ea395edeb0368cb3d04ad.camel@xry111.site>
 <62d25870-2caa-18ab-e58c-cee0bc383e16@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62d25870-2caa-18ab-e58c-cee0bc383e16@loongson.cn>

On Tue, Jun 20, 2023 at 04:29:12PM +0800, Youling Tang wrote:
> Hi, Ruoyao
> 
> On 06/20/2023 04:15 PM, Xi Ruoyao wrote:
> > It looks like only 19 patches are successfully delivered, out of 23.
> I'm sorry, somehow the patchset didn't reach the mailing list. Probably
> due to the sending limit being reached.

I got all the patches, but their threading is broken, they come in
chunks of 5 or :/
