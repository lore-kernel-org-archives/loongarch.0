Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46D7B
	for <loongarch@lists.linux.dev>; Thu, 18 Aug 2022 03:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DCFC433C1;
	Thu, 18 Aug 2022 03:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660791951;
	bh=vqhhkiNkdHNlZyCyTc5/lN1hovE0rDNi4SSiPvcDB0s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zdog8nCGN1WowVKIcAqx/1vyWUuLN6DuB+3/c+KQXeAkCWTVbZfCZT3JZulKeKGOz
	 6I1y0x8P9mEQk3+1MGBPEnXXwAl/OLJj88YeR/2fmM0pJSjJU3fIKiCNz3gLsdHFlx
	 /Y13UTD66J68eCTbp0bIZoCMgGB/yMAj7WHFjjt25blU8JSVsZFMBHaeEZw2vkQgRN
	 C9WALSkdnbB7da3k0YF6pC6Ka5JDV+vUfcI0ytZ/tv2lXUD07YzKo1H3sNTa1cFVoy
	 RB/M/0wFidLxWhNevpkggA1fKQ1wgcwa74VJDBWmqu53xh3xLc/+At73QyacOey0Dx
	 g5dmia+9uIzHw==
Date: Wed, 17 Aug 2022 20:05:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: chris.chenfeiyang@gmail.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, Feiyang Chen <chenfeiyang@loongson.cn>,
 zhangqing@loongson.cn, chenhuacai@loongson.cn, netdev@vger.kernel.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH v2 1/2] stmmac: Expose module parameters
Message-ID: <20220817200549.392b5891@kernel.org>
In-Reply-To: <5bf66e7d30d909cdaad46557d800d33118404e4d.1660720671.git.chenfeiyang@loongson.cn>
References: <cover.1660720671.git.chenfeiyang@loongson.cn>
	<5bf66e7d30d909cdaad46557d800d33118404e4d.1660720671.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Aug 2022 15:29:18 +0800 chris.chenfeiyang@gmail.com wrote:
> Expose module parameters so that we can use them in specific device
> configurations. Add the 'stmmac_' prefix for them to avoid conflicts.
> 
> Meanwhile, there was a 'buf_sz' local variable in stmmac_rx() with the
> same name as the global variable, and now we can distinguish them.

Can you provide more information on the 'why'?
