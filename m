Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C633C0622;
	Mon, 23 Mar 2026 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284951; cv=none; b=bKY+J6G7TPsJnh0hRGzZiUE9os3S9I6jy1ejYJPYOxB/KbOmELyEivPL06LaIxvDPggaKPsblyB8VpndGZ0GO6RjRmTDrQOSll5edwQjX4jG6SP7iXx9TsD0q0PxevnvgZNYZXXuezVQEt9ixgUDKfNs0CCD43Y7e/bAbWa0vm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284951; c=relaxed/simple;
	bh=0LuJYoTQTDvWV9NTWOPFuNPtv2UN3kOMEh+jhXWnc2s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p1PF/ywELsynI3c5BcuLLm81rzOaq/lc+qmjFPvPT0P5Z3sGlr5EhzO0X7bpvkHTmeP6/NX7FqpEkpy8GbqZnv4G/QI6aG76LuXBy+DFmU3O466nJbp+X9ItwaZpUprzTZjNzjyItOw3zDrcp25z0GClQVwuAIZRRBgayfVeMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qgGXTep1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qgGXTep1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F2FC2BC9E;
	Mon, 23 Mar 2026 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774284951;
	bh=0LuJYoTQTDvWV9NTWOPFuNPtv2UN3kOMEh+jhXWnc2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qgGXTep1YmJrPSvqa0ycQRzl2NPgm4AaiOcjYyoeytss6axGtvgS0EzKKZIBsxxsA
	 V6fyRWqr/ZIWLg5r94g6isrv7Lul5Ery6vKJi/XjccJ0tkvgqlQUYmdi/KPsKX+oSy
	 WOcrfjFCALXA7q5Zf2q/7NKZNQeM2jvJT0tXbqY8=
Date: Mon, 23 Mar 2026 09:55:48 -0700
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
 <dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
 <feng.tang@linux.alibaba.com>, <pawan.kumar.gupta@linux.intel.com>,
 <dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
 <paulmck@kernel.org>, <lirongqing@baidu.com>, <safinaskar@gmail.com>,
 <rppt@kernel.org>, <ardb@kernel.org>, <leitao@debian.org>,
 <jbohac@suse.cz>, <cfsworks@gmail.com>, <osandov@fb.com>,
 <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
 <ritesh.list@gmail.com>, <eajames@linux.ibm.com>,
 <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
 <samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
 <junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <liaoyuanhong@vivo.com>,
 <fuqiang.wang@easystack.cn>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <kexec@lists.infradead.org>
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-Id: <20260323095548.fa4e13d6e8ae5005ae585e13@linux-foundation.org>
In-Reply-To: <20260323072745.2481719-1-ruanjinjie@huawei.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2026 15:27:40 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.

Thanks.  AI review has completed and it asks questions:
	https://sashiko.dev/#/patchset/20260323072745.2481719-1-ruanjinjie@huawei.com
