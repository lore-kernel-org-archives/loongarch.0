Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F5CD2E5
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 15:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622E4C433C8;
	Sat, 26 Aug 2023 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693063354;
	bh=E31FwGb2oXUbD3L+jAYfB/z3kLDG1QtXIIRlqVD/tW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUOlpGXWP0rfOLwcK6XCLjc+WM3NEII1xsT8EVwOtb4+tvg+tXCit86bkDONF+1qZ
	 QEmtFAljqcZEJ4H+xH2dIRs2RwjuJ+yueFS00fZllR8d0KWetKzfErE/vrP96oJYcR
	 lHaoCjYS9EPwAx676Wh8+gViDZE6YlRX6YwJ+TRA=
Date: Sat, 26 Aug 2023 17:22:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org
Subject: Re: [PATCH V2] LoongArch: Ensure FP/SIMD registers in the core dump
 file is up to date
Message-ID: <2023082618-mocha-reactor-1dbe@gregkh>
References: <20230826142341.4107728-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826142341.4107728-1-chenhuacai@loongson.cn>

On Sat, Aug 26, 2023 at 10:23:41PM +0800, Huacai Chen wrote:
> This is a port of commit 379eb01c21795edb4c ("riscv: Ensure the value
> of FP registers in the core dump file is up to date").
> 
> The values of FP/SIMD registers in the core dump file come from the
> thread.fpu. However, kernel saves the FP/SIMD registers only before
> scheduling out the process. If no process switch happens during the
> exception handling, kernel will not have a chance to save the latest
> values of FP/SIMD registers. So it may cause their values in the core
> dump file incorrect. To solve this problem, force fpr_get()/simd_get()
> to save the FP/SIMD registers into the thread.fpu if the target task
> equals the current task.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Rename get_fpu_regs() to save_fpu_regs().

What stable tree(s) is this for?

thanks,

greg k-h
