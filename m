Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C22F4A18
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772346609; cv=none; b=J8Z1GK5hHMkeJanLy6JFRqtou6x3SyGI8/Y/Gmf3VwyQddlpvZ4+U6K8G51cricbtTFGatn5sQvbS0Cxe9fKVaDRe3pne1dztrZ94LWTyZ2sWt/fAxncvAzTDrWs5TRqY2kM5u4gjLN26oqUC7cn4zjNQD4s5EJbxE+LipJh/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772346609; c=relaxed/simple;
	bh=isAkMY5xLEvuyv0ACpWczwrAEWOhgfE4drkaGkr+nJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJbhqStIYKMnINpvO9vn7MlaksPK3WdhLGx6SsZ4o21i6JHstrRuLnh2qhUaHHrjMbWjuw1YvzrR2XdNxqf7/Ludepa66noz96xGuYN3JPY+d0GvgU8uYh1SHssQrYxs2U863AEOp7LAzeDGZsU/LLIsNB3v35iG+xjUptJWGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LY1rlaUh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY1rlaUh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE835C2BC9E
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772346608;
	bh=isAkMY5xLEvuyv0ACpWczwrAEWOhgfE4drkaGkr+nJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LY1rlaUhrSu9DflrkMQp741oC2FYx5cStfIynZ6PNA20fYp+HsTGQU59gUQc4k69a
	 rodG+rgz2sZAKZRLNw5Or8w1CxouV/X7BMgCYZd0Fw5MBvQatXM1C0rzaXR8Sgp2Zv
	 J7+aPpT7u6hNX7+86yMTpsnSZXyPz4Y6lS8J/jjxd4BRyAdDtQCi1y5PwZqxhEFqoD
	 hgvaiZ1KXebM3wKr0iakLhhBewjBBQjuZHJij/obqPmXMS7M9+IdLQDm265pq0dNpH
	 D12zyq8jVUuW+bLaVHm8zYci13pIvC9m0fFrJ5qFVpD+tAkD4ZePtrty7YtAuOU5dS
	 CQss5V/xpXJYQ==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65b9d8d6b7dso5567062a12.2
        for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 22:30:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULRfZ4FaqxCoTAxUYA/XWJDZYcfjhA3SLpGjzb06lYgA4D9+mNbBvDcwQ5/otrurBi0Y76HQ25rZs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeY9lWnj5o7lYQwSRQthOGS0sZRYgwXTEVWWkQvo1rQiDl55n+
	FSwTb2all8hdlIUw5Klj18VrQ0+CQ64aYAPGbxkw1FK8V3OBadsxuIs3Ad6JIGcJYMiyV70DXs9
	hyPnbuYrSIgQG+PIdTfbaqhjIvL9ubS8=
X-Received: by 2002:a05:6402:27c9:b0:65c:972:7085 with SMTP id
 4fb4d7f45d1cf-65fddaf6c47mr5131604a12.18.1772346607163; Sat, 28 Feb 2026
 22:30:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301012730.1685022-1-sashal@kernel.org>
In-Reply-To: <20260301012730.1685022-1-sashal@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 1 Mar 2026 14:29:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5b7MHvW-eB4rfMoZBPDR-bTt+xYBq-pqe7VVf=9N+PRQ@mail.gmail.com>
X-Gm-Features: AaiRm50rwQMqz8Y6FgxjFys-UELMehhIJVhXrh0UUnegmJ_nzMcX6gZ0ojDjBkI
Message-ID: <CAAhV-H5b7MHvW-eB4rfMoZBPDR-bTt+xYBq-pqe7VVf=9N+PRQ@mail.gmail.com>
Subject: Re: FAILED: Patch "LoongArch: Make cpumask_of_node() robust against
 NUMA_NO_NODE" failed to apply to 6.12-stable tree
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, john.g.garry@oracle.com, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Sasha,

On Sun, Mar 1, 2026 at 9:27=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> The patch below does not apply to the 6.12-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
I'm very confused because it can be applied and already here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tre=
e/queue-6.12

Huacai

>
> Thanks,
> Sasha
>
> ------------------ original commit in Linus's tree ------------------
>
> From 94b0c831eda778ae9e4f2164a8b3de485d8977bb Mon Sep 17 00:00:00 2001
> From: John Garry <john.g.garry@oracle.com>
> Date: Tue, 10 Feb 2026 19:31:12 +0800
> Subject: [PATCH] LoongArch: Make cpumask_of_node() robust against NUMA_NO=
_NODE
>
> The arch definition of cpumask_of_node() cannot handle NUMA_NO_NODE -
> which is a valid index - so add a check for this.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: John Garry <john.g.garry@oracle.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/include/asm/topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/inclu=
de/asm/topology.h
> index f06e7ff25bb7c..6b79d6183085a 100644
> --- a/arch/loongarch/include/asm/topology.h
> +++ b/arch/loongarch/include/asm/topology.h
> @@ -12,7 +12,7 @@
>
>  extern cpumask_t cpus_on_node[];
>
> -#define cpumask_of_node(node)  (&cpus_on_node[node])
> +#define cpumask_of_node(node)  ((node) =3D=3D NUMA_NO_NODE ? cpu_all_mas=
k : &cpus_on_node[node])
>
>  struct pci_bus;
>  extern int pcibus_to_node(struct pci_bus *);
> --
> 2.51.0
>
>
>
>
>
