Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A831987D;
	Sun, 14 Jun 2026 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781426026; cv=none; b=X7HDwYb8/OaNzubS+IUeQf2Pwg6cxJeiUpPxjPVrMLl3ez5qPNbJFHD1ml6l4NBdVj+ae+GqRWzTiDI2VCbBPQyJR2ZklqkVt36/VkW2Posxla/Kk8XdvqO+9x93jeJ94WtPdVQaeEhXjaY/1xBKFSYygGjDAVprR80tUUCtdhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781426026; c=relaxed/simple;
	bh=X36vCQWITlp3ui2CA5+ohM2l1OunhMyN82vnG8m+67I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nq8J6i8/DhNNjaihdISvAz390y4FgYXMUQuI6Q4Wc7EXotufn82eOlOFFu5jELeyPUipXLuYbTAFRK9GqiQQ5EP4kn2j3E2rhra3sC3WrkQOB5jcX2YEFTRJ6H4IY7Vmaq5YeXlFej1YrKKZ/lYS9Wf1yjbBkTFi9F9t3LA+alA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nREEMt4I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nREEMt4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D2E1F000E9;
	Sun, 14 Jun 2026 08:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781426025;
	bh=que3sP/ffeF4LlJToSGURdqIREPWzcMga9glwfB2Yns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nREEMt4Ib5eW4hGLFtr1gAraUJGIK0UZ0C9Qr9FzmNuLq1kPIAE3Ac+3n3quuV0he
	 wBLzSaEUbRSNCiqYzNae661Q+lju6jVJmDJROXI8kGPhYLwXq2SP8k+SQA8N67s0sn
	 BOIeaputX6CfJr9ANR3wK6VUQFnL65+OHrgZ1nHn4qy8t04rkbA4+yYHpjTiT9jxHi
	 +FCnu4JFhKzoULBbmb/aJhuwK5v02AbQIcqKq2rH5CugOmi3rRyPnzpowzmBVn3KeW
	 gBwuBDM17mxpcDvID1dcUPy4JD91lZeeW5bRw5c7+Z0RLsPtFQmwEkKxehK+PnVeBv
	 5Q+qmTnF0x3gg==
Date: Sun, 14 Jun 2026 11:33:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: George Guo <dongtai.guo@linux.dev>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org, loongarch@lists.linux.dev,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>
Subject: Re: [PATCH v2] liveupdate: luo_session: include linux/mm.h for
 virt/phys translation
Message-ID: <ai5nYlbERQBXRHSp@kernel.org>
References: <20260604091913.306603-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604091913.306603-1-dongtai.guo@linux.dev>

On Thu, Jun 04, 2026 at 05:19:13PM +0800, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> luo_session.c calls virt_to_phys() and phys_to_virt(). On LoongArch with
> CONFIG_KFENCE=y, these macros (in arch/loongarch/include/asm/io.h) expand
> to offset_in_page() and page_address(), both declared in <linux/mm.h>.
> 
> Since luo_session.c only includes <linux/io.h>, the translation unit fails
> to build with CONFIG_KFENCE=y:
> 
>   asm/io.h: error: implicit declaration of function 'offset_in_page'
>   asm/io.h: error: implicit declaration of function 'page_address'
> 
> Add the missing include to fix these build errors.
> 
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Please send this patch along with the series that enable KHO on LoongArch.

> ---
> v2: Move the include from arch/loongarch/include/asm/io.h to the consumer
>     luo_session.c, instead of pulling the heavy <linux/mm.h> into the
>     low-level asm/io.h header (per review feedback). The 0-day report
>     confirmed the v1 approach introduces a circular include
>     (slab.h -> kasan.h -> asm/kasan.h -> asm/io.h -> mm.h, where mm.h
>     needs kfree() before slab.h declares it).
> Link: https://lore.kernel.org/r/20260521063310.52926-1-dongtai.guo@linux.dev/ # v1
> 
>  kernel/liveupdate/luo_session.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index 7a42385dabe2..4ce7128a4ae9 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -62,6 +62,7 @@
>  #include <linux/libfdt.h>
>  #include <linux/list.h>
>  #include <linux/liveupdate.h>
> +#include <linux/mm.h>
>  #include <linux/mutex.h>
>  #include <linux/rwsem.h>
>  #include <linux/slab.h>
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.
