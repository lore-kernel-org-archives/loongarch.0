Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4DFF9D5
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 15:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DBBC433C7;
	Sat, 26 Aug 2023 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693065169;
	bh=2r8AAy315jPDAk6JZfqisWgUEpomjvCHrtYpBhKJg9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcA6V2gNWh9+JQmN0+h1Y8pYPQWGKzgnrkG/K50I2fw2YWdxdMpYo0iSRY2otMDZO
	 hYXs3EiZCin1Rh6mce9Jo7W38MgLE86SJIYTCKCftd1i55FXhpOe+ra88Pnccln4Ct
	 s3KuOKSo4iXmjjBIEBdbOhfAz89kJ88KgcpjFzxs=
Date: Sat, 26 Aug 2023 17:52:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org
Subject: Re: [PATCH V2] LoongArch: Ensure FP/SIMD registers in the core dump
 file is up to date
Message-ID: <2023082611-tactical-embark-d99a@gregkh>
References: <20230826142341.4107728-1-chenhuacai@loongson.cn>
 <2023082618-mocha-reactor-1dbe@gregkh>
 <CAAhV-H4aKT=O1Ly7Zw+oSuVDP73kcXf+boAJK5W=6n76Ftz=WA@mail.gmail.com>
 <2023082609-coerce-capricorn-a69f@gregkh>
 <CAAhV-H532djpsYDPGZxG9g8eiaq2UMGYX_+ADb4kaPpQmgTXYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H532djpsYDPGZxG9g8eiaq2UMGYX_+ADb4kaPpQmgTXYg@mail.gmail.com>

On Sat, Aug 26, 2023 at 11:47:24PM +0800, Huacai Chen wrote:
> On Sat, Aug 26, 2023 at 11:43 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Aug 26, 2023 at 11:35:31PM +0800, Huacai Chen wrote:
> > > On Sat, Aug 26, 2023 at 11:22 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Sat, Aug 26, 2023 at 10:23:41PM +0800, Huacai Chen wrote:
> > > > > This is a port of commit 379eb01c21795edb4c ("riscv: Ensure the value
> > > > > of FP registers in the core dump file is up to date").
> > > > >
> > > > > The values of FP/SIMD registers in the core dump file come from the
> > > > > thread.fpu. However, kernel saves the FP/SIMD registers only before
> > > > > scheduling out the process. If no process switch happens during the
> > > > > exception handling, kernel will not have a chance to save the latest
> > > > > values of FP/SIMD registers. So it may cause their values in the core
> > > > > dump file incorrect. To solve this problem, force fpr_get()/simd_get()
> > > > > to save the FP/SIMD registers into the thread.fpu if the target task
> > > > > equals the current task.
> > > > >
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > ---
> > > > > V2: Rename get_fpu_regs() to save_fpu_regs().
> > > >
> > > > What stable tree(s) is this for?
> > > For 5.19+, but before 6.4 we should remove the call site in simd_get()
> > > because that function doesn't exist.
> >
> > But this commit is already in the following released kernels:
> >         5.10.62 5.13.14 5.14
> Do you means commit 379eb01c21795edb4c ("riscv: Ensure the value of FP
> registers in the core dump file is up to date")? That is a reference
> commit, not a Fixes tag. This patch is for LoongArch and LoongArch
> only exists after 5.19.

Ah, ok, that wasn't obvious sorry.  I thought this was something you
wanted backported to the stable kernel trees based on the comment in the
first few lines of the change.

I'll leave this alone then, thanks!

greg k-h
