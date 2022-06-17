Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16F0291F
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 09:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1655458795; bh=Q+nuDa2ew5oCnRYem5uwgxQVfi09zFsYanu3Lec5dZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TntH/wr8VOhWBbT6Rj2wNhjdIjj0moBjtJWb+9Jga0213JA6zMES21XMm61CErL65
	 cRp0gUp+AQcOsPdtuoplKhRGCH8G9so9iO+wFgqaFvJpb8iQVdl2eB0DjCciu4BMz3
	 PVuJnpAM8VTZhllY9z1kizpCPNOuanpwbGmodzlE=
Received: from [100.100.57.190] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7687C600FF;
	Fri, 17 Jun 2022 17:39:55 +0800 (CST)
Message-ID: <6c0035de-4f45-48c0-1976-e521c81e29a2@xen0n.name>
Date: Fri, 17 Jun 2022 17:39:54 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:103.0)
 Gecko/20100101 Thunderbird/103.0a1
Subject: Re: [PATCH v2 1/2] docs/LoongArch: Rewrite all the notes
To: Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
 alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc: corbet@lwn.net, kernel@xen0n.name, jiaxun.yang@flygoat.com,
 linux-doc@vger.kernel.org, siyanteng01@gmail.com, loongarch@lists.linux.dev
References: <cover.1655456950.git.siyanteng@loongson.cn>
 <ad1d2316a4240ae05697759990b7e0c6f94faa83.1655456950.git.siyanteng@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <ad1d2316a4240ae05697759990b7e0c6f94faa83.1655456950.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/6/17 17:33, Yanteng Si wrote:
> Since 0ea8ce61cb2c ("Documentation: LoongArch: Add
> basic documentations"), Note is an admonition, But
> it doesn't show correctly, let's fix it.

The commit subject is a bit ambiguous: it sounds like some kind of -- 
hmm, rewrite -- of the original sentences, while it's actually only a 
migration to the reST note directive.

I'd suggest re-phrasing the commit message to highlight the "migration" 
nature instead.

>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>   Documentation/loongarch/introduction.rst   | 15 +++++++++------
>   Documentation/loongarch/irq-chip-model.rst | 22 +++++++++++++---------
>   2 files changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/Documentation/loongarch/introduction.rst b/Documentation/loongarch/introduction.rst
> index 2bf40ad370df..46e3f8d54067 100644
> --- a/Documentation/loongarch/introduction.rst
> +++ b/Documentation/loongarch/introduction.rst
> @@ -45,10 +45,12 @@ Name              Alias           Usage               Preserved
>   ``$r23``-``$r31`` ``$s0``-``$s8`` Static registers    Yes
>   ================= =============== =================== ============
>   
> -Note: The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
> -kernel for storing the percpu base address. It normally has no ABI name, but is
> -called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1`` in some old code,
> -however they are deprecated aliases of ``$a0`` and ``$a1`` respectively.
> +.. Note::
> +    The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
> +    kernel for storing the percpu base address. It normally has no ABI name,
> +    but is called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1``
> +    in some old code,however they are deprecated aliases of ``$a0`` and ``$a1``
Nit: space after "code,".
> +    respectively.
>   
>   FPRs
>   ----
> @@ -69,8 +71,9 @@ Name              Alias              Usage               Preserved
>   ``$f24``-``$f31`` ``$fs0``-``$fs7``  Static registers    Yes
>   ================= ================== =================== ============
>   
> -Note: You may see ``$fv0`` or ``$fv1`` in some old code, however they are deprecated
> -aliases of ``$fa0`` and ``$fa1`` respectively.
> +.. Note::
> +    You may see ``$fv0`` or ``$fv1`` in some old code, however they are
> +    deprecated aliases of ``$fa0`` and ``$fa1`` respectively.
>   
>   VRs
>   ----
> diff --git a/Documentation/loongarch/irq-chip-model.rst b/Documentation/loongarch/irq-chip-model.rst
> index 8d88f7ab2e5e..7988f4192363 100644
> --- a/Documentation/loongarch/irq-chip-model.rst
> +++ b/Documentation/loongarch/irq-chip-model.rst
> @@ -145,12 +145,16 @@ Documentation of Loongson's LS7A chipset:
>   
>     https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (in English)
>   
> -Note: CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
> -in Section 7.4 of "LoongArch Reference Manual, Vol 1"; LIOINTC is "Legacy I/O
> -Interrupts" described in Section 11.1 of "Loongson 3A5000 Processor Reference
> -Manual"; EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
> -"Loongson 3A5000 Processor Reference Manual"; HTVECINTC is "HyperTransport
> -Interrupts" described in Section 14.3 of "Loongson 3A5000 Processor Reference
> -Manual"; PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
> -"Loongson 7A1000 Bridge User Manual"; PCH-LPC is "LPC Interrupts" described in
> -Section 24.3 of "Loongson 7A1000 Bridge User Manual".
> +.. Note::
> +    - CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
> +      in Section 7.4 of "LoongArch Reference Manual, Vol 1";
> +    - LIOINTC is "Legacy I/OInterrupts" described in Section 11.1 of
> +      "Loongson 3A5000 Processor Reference Manual";
> +    - EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
> +      "Loongson 3A5000 Processor Reference Manual";
> +    - HTVECINTC is "HyperTransport Interrupts" described in Section 14.3 of
> +      "Loongson 3A5000 Processor Reference Manual";
> +    - PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
> +      "Loongson 7A1000 Bridge User Manual";
> +    - PCH-LPC is "LPC Interrupts" described in Section 24.3 of
> +      "Loongson 7A1000 Bridge User Manual".

This seems like tabular content disguised as a list, but I don't have 
strong preferences here. You may try using a table for this relationship 
between kernel-speak and manual-speak.

With the nits addressed:

Reviewed-by: WANG Xuerui <git@xen0n.name>

