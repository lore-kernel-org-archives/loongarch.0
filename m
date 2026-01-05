Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD933BBCD
	for <loongarch@lists.linux.dev>; Mon,  5 Jan 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617698; cv=none; b=gOFyMt0E6prdjV4p9Y/d9jcSzl4tbwvi5munmQh50zFxqXr6hMbTVZGfQ3Qg82AMUB/5WgLZxuc6wAc3dytkaCoHQGCVudGS3bGDdWVvx5ujXjnkMutFcRN7M2wSFYx+8c9kTlu7fS8p9qCrh1OsNYvdXrfITdebpQ/3QP20ros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617698; c=relaxed/simple;
	bh=zL6lhag8poumof2yywrDlCSdefBdVlO8jyWBlcCkf7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WjSI1LjMkGuG9jvVv734CLdOigZ/3IqUrxJWwHsBtKUCaSMuOWWLCq4s/4CZvGpS0zlF2G8FXDyx6RFTN/itZ4gSZyHSYoZky1eeVUYRXdJ8v/8JwOUzKA7u3FA9z3H5uN63XCGps9DFnyQREQis+ceNBYrKXF2ENNAYY+c22oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRQbA21R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRQbA21R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05547C2BCB3
	for <loongarch@lists.linux.dev>; Mon,  5 Jan 2026 12:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767617698;
	bh=zL6lhag8poumof2yywrDlCSdefBdVlO8jyWBlcCkf7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mRQbA21RRvCKsehK1wDTBbO6V+le+mNr/LbEfSXT+YlCbxL1m4j50CU1ItTBt/Ph+
	 orTEfuge89KZEDFminrYfJ1c+Bhs6mQf+48C041SNDfNetolxIYzTCay4exoqMnLKj
	 3geyhP5eXPZ+9lWR6YfxKyMzm+Og5Ot+bU8Fv/yne/4zXr6M8OvTmKQoqFirm+DJXu
	 fL6PrfhHYntPtNUdfyKleq4yavYMbKa3PPTUzUQuu8bHcbdIn19Nq/cYTv7G8q3Fky
	 25PPu55di5D8rnTlTmj1rRz2isIV/fOQSNz+oaKAatMJw7U5q589t/oUA5APep17qb
	 UUwWE8C6P2a3w==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso24587291a12.1
        for <loongarch@lists.linux.dev>; Mon, 05 Jan 2026 04:54:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNj5YJ62dXX70vlASJCUBrXN/a1WDZvNhVsUS7r0+vy3sV1ING+aTm5MzL4gAzn/KLItkOrbz3Gik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yys7DLa/Pkg+x8xhYvTJKc1dCvpkFpGRwFoRxOQVbxoGKQdswpi
	KVLIMWNXcTnacQhmCMeZCAB6Fk/rndTwrcw2Gfsiy+Vc6wz6yE5HO5GMKuqBK9oEgibBZROr4lf
	uN0m0uSXhVzQg1SGk3pn6nrqnL4L2Uts=
X-Google-Smtp-Source: AGHT+IGP4HZ/2TUYKBADdY91cW94pS30n+uU5/400PQDN3K5KkWMvZEhBLKt04IsRUlTAGudINdwcWuvDH9roPsSNWc=
X-Received: by 2002:a17:906:6a17:b0:b77:1d75:8b78 with SMTP id
 a640c23a62f3a-b8037180282mr5658788566b.53.1767617696466; Mon, 05 Jan 2026
 04:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105100547.287332-1-john.g.garry@oracle.com> <20260105100547.287332-3-john.g.garry@oracle.com>
In-Reply-To: <20260105100547.287332-3-john.g.garry@oracle.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 5 Jan 2026 20:54:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4e9NOuO0ZyYfa1W1CyDnJVuuUDNEOavMS9o+h-u8PzLw@mail.gmail.com>
X-Gm-Features: AQt7F2qqtx1Pf7DQ_-QlB0f12BIIVBkEvOqtxPbkSj8UAd_Q5x9qB4M5wM6cbz4
Message-ID: <CAAhV-H4e9NOuO0ZyYfa1W1CyDnJVuuUDNEOavMS9o+h-u8PzLw@mail.gmail.com>
Subject: Re: [PATCH 2/4] LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE
To: John Garry <john.g.garry@oracle.com>
Cc: kernel@xen0n.name, jiaxun.yang@flygoat.com, tsbogend@alpha.franken.de, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, arnd@arndb.de, x86@kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arch@vger.kernel.org, vulab@iscas.ac.cn, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, John,

On Mon, Jan 5, 2026 at 6:07=E2=80=AFPM John Garry <john.g.garry@oracle.com>=
 wrote:
>
> The arch definition of cpumask_of_node() cannot handle NUMA_NO_NODE - whi=
ch
> is a valid index - so add a check for this.
>
> Signed-off-by: John Garry <john.g.garry@oracle.com>
> ---
>  arch/loongarch/include/asm/topology.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/inclu=
de/asm/topology.h
> index f06e7ff25bb7c..9857e4c20023c 100644
> --- a/arch/loongarch/include/asm/topology.h
> +++ b/arch/loongarch/include/asm/topology.h
> @@ -12,7 +12,9 @@
>
>  extern cpumask_t cpus_on_node[];
>
> -#define cpumask_of_node(node)  (&cpus_on_node[node])
> +#define cpumask_of_node(node)  ((node) =3D=3D NUMA_NO_NODE ?       \
> +                               cpu_all_mask :                  \
> +                               &cpus_on_node[node])
You can define it in one line, so does the MIPS version.

Huacai

>
>  struct pci_bus;
>  extern int pcibus_to_node(struct pci_bus *);
> --
> 2.43.5
>
