Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32D98C0D
	for <loongarch@lists.linux.dev>; Tue, 11 Apr 2023 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681220622; x=1712756622;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2GeQQq+KcbTCEU+rXh5JGw+yLkL8a8JmHupdRnaoc8M=;
  b=M/wVEp1H2DokNxtOrrZv1fleBAvnTDEcK61tE/lpjo9dqAkvUbF6jbS2
   vPF31nRlFnV4yJjAZVZpqAqo2e4pvAighHLM6RNl5Vz9mQ6YFuT0M0pu2
   gwKPAlGJ1uzESvnnavfxoorZmSLJagyPRbeiPAK9O2LAMbKyquFAyKVAG
   UI12RCc6Vb8SIVeGWlc9xuvm2V0bQqILm4CnF+sSAKONRDWuSjkcXk2Qu
   DKJG7V/uABzSiNFQDbED52rnPCVCz1z9nsOg5VhzL6M4T86zTJogio4+A
   Q0R7XxC7D5xJptpdISTQGrL8baVYw4TGQ2viVXnda/9x14tPLQE8qcUS1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="429905388"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="429905388"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 06:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812566489"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="812566489"
Received: from gtryonx-mobl.amr.corp.intel.com (HELO [10.209.72.81]) ([10.209.72.81])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 06:43:39 -0700
Message-ID: <1fee0372-3a3b-5e09-38c3-ffb3523fe195@intel.com>
Date: Tue, 11 Apr 2023 06:43:39 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, linux-alpha@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Jun Yi <yijun@loongson.cn>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
 <ZDVGFhMwOtpxJtnQ@FVFF77S0Q05N>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <ZDVGFhMwOtpxJtnQ@FVFF77S0Q05N>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/23 04:35, Mark Rutland wrote:
> I agree it'd be nice to have performance figures, but I think those would only
> need to demonstrate a lack of a regression rather than a performance
> improvement, and I think it's fairly clear from eyeballing the generated
> instructions that a regression isn't likely.

Thanks for the additional context.

I totally agree that there's zero burden here to show a performance
increase.  If anyone can think of a quick way to do _some_ kind of
benchmark on the code being changed and just show that it's free of
brown paper bags, it would be appreciated.  Nothing crazy, just think of
one workload (synthetic or not) that will stress the paths being changed
and run it with and without these changes.  Make sure there are not
surprises.

I also agree that it's unlikely to be brown paper bag material.
