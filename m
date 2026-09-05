Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601F49EC65
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620706; cv=none; b=NPqOjkMlnX8Jozlf1t7/l/XLivbMKeRnmdNftdvAJio2cVupO9P/0GkJ2iyndxwYpUSo49u+IWYyG3z88/ZnKMQN3Z2Ob6IyUVE3ZdorLqNHbMIeQr7DTNhA1s9bRyGxd/kNeJ27SYLY90lrYDio4qPp3XnUFZe/NSf3mHYaG4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620706; c=relaxed/simple;
	bh=w9DPXdW2XpPBZlLrO8cXtyah84iqZAvvL3xF8eE7a6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXAJvK/ae2y0DshoAG53nXo8AcoJuHTdyECHwYjohrjjlxM28YLt2b8r1kNPFqtey48eX15OnSXoaLG63JSTXIQJ5nOgMNQxlLRy2z1BHzn8eTHqe3X86Tcus4ZnEPP5JJn+dKnFqU6CGDLNxQWjxCdmHZuDvOdJ8sLLn4ojWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coHrXujP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coHrXujP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADFD1F00A3E
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788620702;
	bh=h/JLEiMRZT9DUsW9Ku3CfAcZ3JAuJJ+hQEy8vaUF23E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=coHrXujPEzzKUHJb9KecZprixN+BEkCjoN4RAVOKInqGDgJJNPTpM+H3fVmrhZiPK
	 i6koPuv3f7bsaugbSR8OSoSYQF7zSiBlxmFK/18PN8JHCNGZTkJnkJ99rwl04lX6Mo
	 S6/sxY7oTDRsArEcnRD7x2yBZ2RUuvYaKJZ769XiReE+okKmb5mybPt+pcGUYxJmro
	 33oo3jZHmpea1BoTrFdZ2elTXc5xBaM7InpLI5G1zlHlGrk/pn9I8ob6Me46gjEsxl
	 xk+/1lqdZxS254QeeaE91ddB601/aV4JPqTd29Tm7fMN0mWCIcBM5gHJmybNDP+OL2
	 2Y9rhYKVOM9qg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so3240487a12.3
        for <loongarch@lists.linux.dev>; Sat, 05 Sep 2026 08:05:02 -0700 (PDT)
X-Gm-Message-State: AFuF++nNJfbHLMOC6MI9pP+msNp184Kgz5+yAcQMeuNx5aHkzlQTJY6D
	+mSveJh9osd3I+y3Npm/p7YZYFQdzHklRCeDDylVXM/KHJ1U90I9V5Xwnv7U2UOs8mmdB1PcgKS
	aDFXn6O8D9nLl08lbXpkL0A2QOsqV1dA=
X-Received: by 2002:a05:6402:3607:b0:6a7:ea54:37d with SMTP id
 4fb4d7f45d1cf-6a7ea541e23mr3520150a12.37.1788620700724; Sat, 05 Sep 2026
 08:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820124933.144476-1-ailiop@suse.com>
In-Reply-To: <20260820124933.144476-1-ailiop@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 5 Sep 2026 23:04:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4GX3uYqd-EXT-0Go_r=ad5ZcP+QqG9xgL40HFLnsZZ0A@mail.gmail.com>
X-Gm-Features: AcwNN1UmZKL8m6voCv7ytVUZzEEkby6_mawzHd3fWAOkmIJOaCA5YAMG0kA3hrY
Message-ID: <CAAhV-H4GX3uYqd-EXT-0Go_r=ad5ZcP+QqG9xgL40HFLnsZZ0A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: remove unused setup_profiling_timer function
To: Anthony Iliopoulos <ailiop@suse.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.


Huacai

On Thu, Aug 20, 2026 at 8:49=E2=80=AFPM Anthony Iliopoulos <ailiop@suse.com=
> wrote:
>
> setup_profiling_timer() is not used by any code at this point. Since a
> default weak implementation exists, there is no need to keep this
> arch-specific definition around. Remove it along with the now-redundant
> profile header includes.
>
> Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
> ---
>  arch/loongarch/kernel/smp.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index d4b5d1b6bb01..11f54837f56c 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -14,7 +14,6 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq_work.h>
> -#include <linux/profile.h>
>  #include <linux/seq_file.h>
>  #include <linux/smp.h>
>  #include <linux/threads.h>
> @@ -716,13 +715,6 @@ void smp_send_stop(void)
>         smp_call_function(stop_this_cpu, NULL, 0);
>  }
>
> -#ifdef CONFIG_PROFILING
> -int setup_profiling_timer(unsigned int multiplier)
> -{
> -       return 0;
> -}
> -#endif
> -
>  static void flush_tlb_all_ipi(void *info)
>  {
>         local_flush_tlb_all();
> --
> 2.55.0
>
