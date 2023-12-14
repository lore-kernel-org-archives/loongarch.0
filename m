Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5C4123D;
	Thu, 14 Dec 2023 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uS4aRUnW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7CAC433C7;
	Thu, 14 Dec 2023 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702580943;
	bh=fc/UftNAZymDL/BEfNACvVBgFN3fYFGFmXjc4gD6Cl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uS4aRUnWCZHjIn7Lwgfbum0YUDuYvyQs4dmkeprY7+xBjxpEEKyHnDV+wvBn8oLTo
	 BoRIysN+7HvZejFK2yuLVJla4ODr8orNHsoncerthTfhmB5pzQvbLVkxNjlH+L2QyX
	 HKbnqTLevPnTWKANQ9YPgRnPZy6pHc+Ilda4gA2dPEdb5re+7XnelAVn5UWrWejeRk
	 5ODZBgpsUqvxrJXOVyxAvQyh5raGXraVyXiAJh/gUII556oSCBSOSlVEVx08eqpSiP
	 z5p9FYtYYHnuB/4nCrfpnjDeo2AOrMDg1l84w17zdxN03rufOCHlaD/kRrvMGdQpN6
	 AUj1LrEclqi1w==
Date: Thu, 14 Dec 2023 11:09:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 fancer.lancer@gmail.com, Jose.Abreu@synopsys.com, chenhuacai@loongson.cn,
 linux@armlinux.org.uk, guyinggang@loongson.cn, netdev@vger.kernel.org,
 loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v6 0/9] stmmac: Add Loongson platform support
Message-ID: <20231214110901.216f11db@kernel.org>
In-Reply-To: <cover.1702458672.git.siyanteng@loongson.cn>
References: <cover.1702458672.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Dec 2023 18:12:22 +0800 Yanteng Si wrote:
> [PATCH v6 0/9] stmmac: Add Loongson platform support

Please use --subject-prefix="PATCH net-next vN" to indicate that 
the patches are for the networking tree.

Unfortunately they do not apply so you'll have to rebase and resend.
-- 
pw-bot: cr
