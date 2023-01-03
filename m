Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094333FF
	for <loongarch@lists.linux.dev>; Tue,  3 Jan 2023 12:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2552C433D2
	for <loongarch@lists.linux.dev>; Tue,  3 Jan 2023 12:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672749122;
	bh=ZfFVu6/VEmf01cNN3Hpd4+n2awjxm1gjNPAfMihfTgQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FWmbtCpIRiT22PIuiqUsNSzySDhsHsntl2xQM6VCUC6ToRD6mTvBurmWerHbekdfz
	 6lLZ0NQq1RpBFMGZN6kxmqBeP/My3aU+uX6pD4qF8FDZuYRexPyGEmVmrprnEZxU2D
	 pGw0QJW6pw2lOz+6fq8VUo2hMlFPn5xti5YWYLj3th5/mf0SfhTx/8OO8jNz2sirk1
	 3KpzWC47XSt75JugboyMgMiYuyqc2nM2dOY/a42wOySB0baa1MhGljyPj/CRc9ABXZ
	 9FGfKXKi33oeggGbxLPu2LtMH+0oAhAl4ybIVxUXFZnkShfaGPySRToZtXdCjpmkZa
	 7+RH5mDCxKxng==
Received: by mail-ed1-f42.google.com with SMTP id c34so36982185edf.0
        for <loongarch@lists.linux.dev>; Tue, 03 Jan 2023 04:32:02 -0800 (PST)
X-Gm-Message-State: AFqh2kqzCrtr1IzImAQfifndkP8PC6td8/37kIUsyYbL0UCHE+YId1G1
	29NeU0/oVLAAUiz7Wxktg3SFqb3xs/EWwNAz/GQ=
X-Google-Smtp-Source: AMrXdXvc+wmSp+1x4TmjAF1Z2JGlDV1vnAKvpt87+OFqwtTjwAXLZ010qiBExvlVNgI8zdrhkqPAwbrA+E29jLos2fM=
X-Received: by 2002:a05:6402:3809:b0:48a:5f4c:c1a with SMTP id
 es9-20020a056402380900b0048a5f4c0c1amr1361103edb.298.1672749120936; Tue, 03
 Jan 2023 04:32:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231100757.3177034-1-hengqi.chen@gmail.com>
 <CAAhV-H6hdXXE4EwFe66rUxJMixc=s7PYuxeyCjaQ5z3Fck40jA@mail.gmail.com> <9d2d3268-6558-2387-7d26-0fc51c365204@iogearbox.net>
In-Reply-To: <9d2d3268-6558-2387-7d26-0fc51c365204@iogearbox.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 3 Jan 2023 20:31:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7+XeCmxCbpEqWzDt+S_UabPLyyn+uGe7qCkr-HbYCRrQ@mail.gmail.com>
Message-ID: <CAAhV-H7+XeCmxCbpEqWzDt+S_UabPLyyn+uGe7qCkr-HbYCRrQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Add LoongArch support to bpf_tracing.h
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, bpf@vger.kernel.org, loongarch@lists.linux.dev, 
	andrii@kernel.org
Content-Type: text/plain; charset="UTF-8"

OK, bpf-next is also fine for me.
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Tue, Jan 3, 2023 at 8:28 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 1/3/23 7:53 AM, Huacai Chen wrote:
> > LGTM, I will queue this patch for loongarch-next if no one has
> > objections. Thank you.
>
> To avoid potential merge conflicts for the next dev cycle, any objections if
> you could Ack it and we'd take it via bpf-next tree instead?
>
> Thanks,
> Daniel
