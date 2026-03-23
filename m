Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3912192FA;
	Mon, 23 Mar 2026 01:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774231135; cv=none; b=WUaiIeCrcG6k3WODryL8QVtzVs+6aiUyiJNcIzaoQkvcIUxKci/Ms76GXRUUA9pOSPyOwTvIwn0jIRHxtPpUM55KTTMiFCzrkhTZ0osKczFfQA3DDkmRKF02BvP3mB4l9eo4KYMhKeaJq7wh3TKlcVvqrD6Z48t1U7v3FcyGZYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774231135; c=relaxed/simple;
	bh=BnMGF1hF1WW6/Gtz51mz8K6u9S5YKJbEi/GgrCMRCcI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BUZlHNfyK3P/P9vHF9lySlEKh1aWShrrnj8SI0x1WJLLeiXMQtAuirQzpnl3I/zteA0F/KBsFKyqS4v2WCyz+u6roHu0j+RIE5aFuf8vRrMc3E1CLTFo+V+sRnmf2D++h7sWxZIDULm/Ywt87PL4BZikzembWGFNZsk6M7mt5bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VUjWpCug; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VUjWpCug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDC1C19424;
	Mon, 23 Mar 2026 01:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774231135;
	bh=BnMGF1hF1WW6/Gtz51mz8K6u9S5YKJbEi/GgrCMRCcI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VUjWpCugJPseIiCzojaappy2G56EwCcFlTk+RHuPMDdvwdR+EnL347w7LI3UCkvJb
	 p9PH86lqJGd5d9hIqvjbLcmg8iQU6feQ0ZVbWqW3VTot+FFLI/AX0mmwLJnk/ehCFb
	 exrnpKMx8yIqEq95ldNOVe4Nf90pZVklGv2yI3F8=
Date: Sun, 22 Mar 2026 18:58:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
 <kernel@xen0n.name>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
 <npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
 <saravanak@kernel.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
 <dyoung@redhat.com>, <rdunlap@infradead.org>, <pmladek@suse.com>,
 <dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <paulmck@kernel.org>,
 <lirongqing@baidu.com>, <fvdl@google.com>, <rppt@kernel.org>,
 <ardb@kernel.org>, <leitao@debian.org>, <sourabhjain@linux.ibm.com>,
 <jbohac@suse.cz>, <cfsworks@gmail.com>, <osandov@fb.com>,
 <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
 <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
 <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
 <samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
 <junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <liaoyuanhong@vivo.com>,
 <fuqiang.wang@easystack.cn>, <brgerst@gmail.com>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
Subject: Re: [PATCH v8 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-Id: <20260322185853.e8e43c346ed98a0ef0544948@linux-foundation.org>
In-Reply-To: <ce99a024-f910-cd83-c60a-28e60db318d3@huawei.com>
References: <20260302035315.3892241-1-ruanjinjie@huawei.com>
	<ce99a024-f910-cd83-c60a-28e60db318d3@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2026 09:44:21 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> If there are no other review comments, I'd like to ask if this is ready
> to be merged.

This patchset predates the introduction of the Sashiko AI review, and
that thing is proving very good at finding issues.

So can you please update the changelog footers for thus-far-received
acks/reviews and then resend?

Thanks.

