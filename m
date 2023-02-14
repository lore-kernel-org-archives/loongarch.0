Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C6B290D
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 06:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3561C433EF;
	Tue, 14 Feb 2023 06:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676356810;
	bh=epEYT2bBFKhloOKJkQKS1toE8ZF4uZ/r0fMG2x/8Yuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lyf7vA2oE0qTtQcTHrOPakOqIdRGcOr3diK1jL93GrHP3JbutcqRuJhghYW2xlnuv
	 tB4llqDiMgkYnRi+SX8qUb/NzZiCp0IeoZEFtl0n1fv7d5l+873DkLS3MGOJNUKqmU
	 kuLv+Tjl+27mjIZ8X+zYzeL8MxxpdRVasAlyo1XE=
Date: Tue, 14 Feb 2023 07:40:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v1 03/24] LoongArch: KVM: Implement vcpu
 create,run,destroy operations.
Message-ID: <Y+ssx3hQPD2l23u+@kroah.com>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
 <20230214025648.1898508-4-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214025648.1898508-4-zhaotianrui@loongson.cn>

On Tue, Feb 14, 2023 at 10:56:27AM +0800, Tianrui Zhao wrote:
> Implement loongarch vcpu related operations:
> 1. Implement vcpu create interface, saving some info into vcpu arch
> structure such as vcpu exception entrance, vcpu enter guest pointer,
> etc. Init vcpu timer and set address translation mode when vcpu create.
> 2. Implement vcpu run interface, handling mmio, iocsr reading fault
> and deliver interrupt, lose fpu before vcpu enter guest.
> 3. Implement vcpu handle exit interface, getting the exit code by ESTAT
> register and using kvm exception vector to handle it.

Again, when you have to list different things in a patch, that is a huge
hint that it needs to be split up into smaller pieces.

thanks,

greg k-h
