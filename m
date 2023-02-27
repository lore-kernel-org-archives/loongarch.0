Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CD808
	for <loongarch@lists.linux.dev>; Mon, 27 Feb 2023 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677491698; x=1709027698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rr6xwo2PCVOiBN2/EFJWwIunjAZhcH+OTt1joV7rt6Y=;
  b=eElZybOIW+Hw3czgZRqciNZ7P7dG70Tu7Z+9t+hWlePDLGv37v51E+Dn
   E2jKMx2RdhtVWFAuxj/RAG3pCNij9nftYktqb+rZYiOMiF1cCiCcQYtfC
   bht53WdrbCpof0+d153AIpDwMT8omp5vGo8nnH1Iel5KMRVZ5twirk/+c
   6+qqOL/KZHgkoXY0bJR2yB4qO+p8HjLUwSfP25liKiUS5cgtDm5SpSaRG
   hFQLAOWf/klS+rPwxzKF97gojwngzIG4t2pOeoj0WbsYHvy5SpPd6fojT
   8ZLb8Plv1vlSbM2AyCJPdoYm6O00XpVqt2FCNjrKnLEfxVaM7vgGOOoyx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="398596718"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="398596718"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:54:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="706118261"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="706118261"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com) ([10.249.41.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:54:49 -0800
Date: Mon, 27 Feb 2023 10:54:46 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 3/7] arch/*/uprobes: simplify
 arch_uretprobe_hijack_return_addr
Message-ID: <Y/x95g9aUmMdO7Hu@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-3-andrzej.hajda@intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-3-andrzej.hajda@intel.com>

Hi Andrzej,

On Wed, Jan 18, 2023 at 04:44:46PM +0100, Andrzej Hajda wrote:
> In all architectures, except x86, arch_uretprobe_hijack_return_addr
> is just __xchg.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
