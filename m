Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5735633CE3
	for <loongarch@lists.linux.dev>; Thu, 16 Nov 2023 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT2DIpaT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A37C433C7;
	Thu, 16 Nov 2023 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700156380;
	bh=Zgd5QCuzvKEJFDLFEKjM60EEmgTalFX8rouizgN0mfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YT2DIpaTL/Eiy2JY8VlYnI5iD/v6L2uFCfNsxeK3EPGEhUcUYlDWkQZ1dtcIOeCOL
	 wJe4OcPAfJkKyddrzmWmYkai++zzS8XhZeVQcev1JzQ0Zq+ymqDD49St0VsLwsmarT
	 pILUUFml2MuTk9CI1F2aN4k9MvP2fq8L8VFmEBYPTMxfDxEZcyrEcHEviXKT2bO6fQ
	 4O5MFVu1jtKZW7j8m8k4TXIc2QW9dzbdCy59Un6imvMj8ar1XxZXRtjnBlan7gXsi/
	 kpMFSd5lUJIiiPDk7hvPk3WM78Hf7aG4Ckk+hgVOnX3X0mT3hx7ae1B3t5ca16vMMs
	 7IBlvTg4FO1Qg==
Date: Thu, 16 Nov 2023 12:39:39 -0500
From: Sasha Levin <sashal@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>, maobibo@loongson.cn,
	palmer@rivosinc.com, yangtiezhu@loongson.cn, wangliupu@loongson.cn,
	jpoimboe@kernel.org, zhoubinbin@loongson.cn,
	loongarch@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.6 4/6] LoongArch/smp: Call
 rcutree_report_cpu_starting() earlier
Message-ID: <ZVZT27pS16Y7S9wQ@sashalap>
References: <20231115033350.1228588-1-sashal@kernel.org>
 <20231115033350.1228588-4-sashal@kernel.org>
 <CAAhV-H61R006eHGN+ujvDqrT_6AYV0XBcSaT2zyVLJi1rR=kMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAAhV-H61R006eHGN+ujvDqrT_6AYV0XBcSaT2zyVLJi1rR=kMA@mail.gmail.com>

On Wed, Nov 15, 2023 at 11:55:24AM +0800, Huacai Chen wrote:
>Hi, Sasha,
>
>In 6.6 and earlier versions, rcutree_report_cpu_starting() should be
>rcu_cpu_starting().

I'll drop this one. Happy to apply a backport...

-- 
Thanks,
Sasha
