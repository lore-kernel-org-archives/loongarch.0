Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287B14A94
	for <loongarch@lists.linux.dev>; Mon, 19 Jun 2023 20:18:29 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3185173a12.3
        for <loongarch@lists.linux.dev>; Mon, 19 Jun 2023 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687205909; x=1689797909;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmEEut0OCJI0jheFei8v4KFIgPFEx+9Zr0oYZPTVJvw=;
        b=ML1POuSF5TNYpNiqkU7Wmm/FZLBDFoP32DY+WPylpmv43DoaA/AoXnTGG2wwzhld3j
         kjkKToRZCKl1S0ycKV+IUNrHAQ8Dvck3h+D7ZuCxy/PFvkOP44vPViwvWsYYl0BBuNgy
         b/5HPeUCxmK/jPGro6a0V6gtwlQJxSWG+MjbaRDV7mR48t508gCxLWi7cw8WSlTAdLEO
         3p+win9LgLE5lOsK+rw7eJ7na0iRAHUh7i2pWPNrn0k/YllS2kfgOgB31VmT4hCseChr
         k2Wm+WLNvD9nhPcsjkRc0OVcXyGOSUiyWGCOpqitL1ReK2kli6NusXAAxFAtCrHDui7k
         NzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687205909; x=1689797909;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmEEut0OCJI0jheFei8v4KFIgPFEx+9Zr0oYZPTVJvw=;
        b=O/1ys8GDFwnOdV48xu3hV/+FebVqGzIPLDAEhpg5TAlqF9nJJVH2CfJEaGwXbXSrYW
         zJuP7qhEG367g1UBSpK57r619BstEamSByG8Q/fDf/vAmfDeaxwMagl8HqZFyFppskYQ
         IzRX5+fsGhC2dWfxiYV7HJO2foidhr2kYcAO+ImwrQ/4OqtcS6j+SUaypZQtmCn67xZo
         gy0F76saNaCZywDtvSBht3snfC7U7A5qnhFaoDw9txzfDFPjVF6HCP76wA3/nH9Jej1/
         PVbMCVTTLjBSTnYasNh2vP7GEmJAJ5veK3RtC9qgFFx7wCuWF8OSCOs1odo5+B97ZqCy
         GRcg==
X-Gm-Message-State: AC+VfDxZ0lEJYBcMrC8com0mF3aDpu2WYTWycNB6+yI6DXBaooeiXCV1
	92VnsYj6np4LQ/UYq9HY1fA=
X-Google-Smtp-Source: ACHHUZ4MAGz/Bbdlo+4DcmVI4O990mBmojRaVLNYuDWhcs7i7MC/1uf1G62Dkn3iaVvHJNN3c8J+8g==
X-Received: by 2002:a05:6a21:78a9:b0:10a:cb95:5aa3 with SMTP id bf41-20020a056a2178a900b0010acb955aa3mr14231287pzc.7.1687205909086;
        Mon, 19 Jun 2023 13:18:29 -0700 (PDT)
Received: from smtpclient.apple ([66.170.99.1])
        by smtp.gmail.com with ESMTPSA id k18-20020a637b52000000b005538bf7e3d6sm87568pgn.88.2023.06.19.13.18.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jun 2023 13:18:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and
 jit_text_alloc()
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
Date: Mon, 19 Jun 2023 13:18:15 -0700
Cc: Mike Rapoport <rppt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Puranjay Mohan <puranjay12@gmail.com>,
 Rick P Edgecombe <rick.p.edgecombe@intel.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 bpf <bpf@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>,
 linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 loongarch@lists.linux.dev,
 netdev@vger.kernel.org,
 sparclinux@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7F566E60-C371-449B-992B-0C435AD6016B@gmail.com>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
To: Andy Lutomirski <luto@kernel.org>,
 Song Liu <song@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)



> On Jun 19, 2023, at 10:09 AM, Andy Lutomirski <luto@kernel.org> wrote:
>=20
> But jit_text_alloc() can't do this, because the order of operations =
doesn't match.  With jit_text_alloc(), the executable mapping shows up =
before the text is populated, so there is no atomic change from =
not-there to populated-and-executable.  Which means that there is an =
opportunity for CPUs, speculatively or otherwise, to start filling =
various caches with intermediate states of the text, which means that =
various architectures (even x86!) may need serialization.
>=20
> For eBPF- and module- like use cases, where JITting/code gen is quite =
coarse-grained, perhaps something vaguely like:
>=20
> jit_text_alloc() -> returns a handle and an executable virtual =
address, but does *not* map it there
> jit_text_write() -> write to that handle
> jit_text_map() -> map it and synchronize if needed (no sync needed on =
x86, I think)

Andy, would you mind explaining why you think a sync is not needed? I =
mean I have a =E2=80=9Cfeeling=E2=80=9D that perhaps TSO can guarantee =
something based on the order of write and page-table update. Is that the =
argument?

On this regard, one thing that I clearly do not understand is why =
*today* it is ok for users of bpf_arch_text_copy() not to call =
text_poke_sync(). Am I missing something?

